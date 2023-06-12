import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:hitrash/providers/mapprovider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  final Function(LatLng) onLocationSelected;

  MapView({required this.onLocationSelected});

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<MapProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: mapProvider.latLng,
              onMapReady: () {
                mapProvider.mapReady = true;
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://mt3.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: mapProvider.latLng,
                    builder: (context) {
                      return Stack(
                        children: [
                          Positioned(
                            top: MediaQuery.of(context).size.height / 2 - 20,
                            left: MediaQuery.of(context).size.width / 2 - 20,
                            child: Icon(
                              Icons.location_on,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
            mapController: mapProvider.mapController,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 -
                20, // Menyesuaikan ikon di tengah vertikal
            left: MediaQuery.of(context).size.width / 2 -
                20, // Menyesuaikan ikon di tengah horizontal
            child: Icon(
              Icons.location_on,
              color: Colors.blue,
              size: 40,
            ),
          ),
          Positioned(
            bottom: 10,
            left: (MediaQuery.of(context).size.width / 2) - 30,
            child: ElevatedButton(
              child: Text('Pilih'),
              onPressed: () {
                final selectedLocation = mapProvider.selectedLocation;
                if (selectedLocation != null) {
                  onLocationSelected(selectedLocation);
                }
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
