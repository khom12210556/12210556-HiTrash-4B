import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapProvider with ChangeNotifier {
  LocationAccuracy _accuracy = LocationAccuracy.low;
  LatLng latLng = LatLng(0, 0);
  LatLng latlng_lama = LatLng(0, 0);

  MapController mapController = MapController();
  bool mapReady = false;
  bool mulaibaca = false;

  void mulai_bacalokasi() {
    if (mulaibaca == false) {
      mulaibaca = true;
      _bacalokasi();
    }
  }

  void stop_bacalokasi() {
    mulaibaca = false;
  }

  Future<bool> cekIzin() async {
    var izin = await Geolocator.checkPermission();
    if (izin != LocationPermission.always &&
        izin != LocationPermission.whileInUse) {
      izin = await Geolocator.requestPermission();
    }
    if (izin != LocationPermission.always &&
        izin != LocationPermission.whileInUse) {
      return false;
    }
    return true;
  }

  Future _bacalokasi() async {
    final izin = await cekIzin();
    if (izin == false) return;

    try {
      //baca lokasi sesuai akurasi yang ditentukan
      final lokasi =
          await Geolocator.getCurrentPosition(desiredAccuracy: _accuracy);

      print('lokasi saat ini: $lokasi');

      //simpan koordinat dari lokasi latitude dan longitude ke property latlng
      latLng = LatLng(lokasi.latitude, lokasi.longitude);
      naikkan_akurasi(); // <-- naikkan akurasi, karna tidak eror

      if (mapReady == true) {
        //jika mapReady (sudah siap)
        // baca jarak antara posisi  baru dengan posisi sebelumnya
        final jarak = Geolocator.distanceBetween(latLng.latitude,
            latLng.longitude, latlng_lama.latitude, latlng_lama.longitude);
        //jika jarak perbedaan lebih dari 100m
        if (jarak > 100) {
          latlng_lama = latLng; //<-- simpan posisi baru ke posisi lama
          //pindahkan kamera tampilan map ke posisi baru
          mapController.move(latLng, mapController.zoom);
        }
      }
      print('dapat lokasi $lokasi');
    } catch (e) {
      print('eror lokasi = $e');
      turunkan_akurasi();
    }
    if (mulaibaca == true) {
      //tunggu 1 detik agar aplikasi tidak lag
      await Future.delayed(Duration(seconds: 1));
      _bacalokasi(); //panggil kembali _bacalokasi()
    }
  }

  void turunkan_akurasi() {
    if (_accuracy == LocationAccuracy.bestForNavigation) {
      _accuracy = LocationAccuracy.best;
    } else if (_accuracy == LocationAccuracy.best) {
      _accuracy = LocationAccuracy.medium;
    } else if (_accuracy == LocationAccuracy.medium) {
      _accuracy = LocationAccuracy.low;
    }
  }

  void naikkan_akurasi() {
    if (_accuracy == LocationAccuracy.low) {
      _accuracy = LocationAccuracy.medium;
    } else if (_accuracy == LocationAccuracy.medium) {
      _accuracy = LocationAccuracy.best;
    } else if (_accuracy == LocationAccuracy.best) {
      _accuracy = LocationAccuracy.bestForNavigation;
    }
  }
}
