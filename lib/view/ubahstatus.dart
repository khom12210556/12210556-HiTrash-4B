import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hitrash/providers/mapprovider.dart';
import 'package:hitrash/view/permintaanpenjemputan.dart';
import 'package:provider/provider.dart';

class ubahStatus extends StatelessWidget {
  const ubahStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider = context.read<MapProvider>();
    return Scaffold(
      backgroundColor: Color(0xFF0079BF),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 2, 2, 2).withOpacity(0.1)),
                child: InkWell(
                  onTap: () {
                    print('Back');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PesananView()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 50),
              Image.asset(
                'assets/loggo.png',
                width: 200,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ubah Status Penjemputan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              margin: EdgeInsets.all(50),
              child: Container(
                width: 300,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal : 01 May 2023',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Jam Mulai : 10:30 AM',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Alamat : jl. Karet Pontianak',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Pemesan : Messi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Status : Baru',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapView()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.green,
                            ),
                            width: 260,
                            height: 150,
                            child: FlutterMap(
                              options: MapOptions(
                                center: Provider.latLng,
                                onMapReady: () {
                                  Provider.mapReady = true;
                                },
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: Provider.latLng,
                                      builder: (context) {
                                        return Icon(
                                          MaterialCommunityIcons
                                              .map_marker_outline,
                                          color: Colors.red,
                                          size: 20,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              mapController: Provider.mapController,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}