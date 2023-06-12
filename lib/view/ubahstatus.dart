import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hitrash/providers/mapprovider.dart';
import 'package:hitrash/view/dashboardCostumer.dart';
import 'package:hitrash/view/dashboardPenjemput.dart';
import 'package:hitrash/view/mapview.dart';
import 'package:hitrash/view/permintaanpenjemputan.dart';
import 'package:provider/provider.dart';
import 'package:hitrash/view/mapview.dart';

class ubahStatus extends StatefulWidget {
  const ubahStatus({Key? key}) : super(key: key);

  @override
  State<ubahStatus> createState() => _ubahStatusState();
}

class _ubahStatusState extends State<ubahStatus> {
  String selected = "baru";

  List<String> data = const ["baru", "selesai", "batal"];

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
                        'Status : $selected',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      map(Provider: Provider),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 30, 247, 142),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: DropdownButton<String>(
                              value: selected,
                              hint: Text("Status"),
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  selected = value!;
                                });
                              },
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                              items: data
                                  .map((e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      )
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

class map extends StatelessWidget {
  const map({
    super.key,
    required this.Provider,
  });

  final MapProvider Provider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardView()),
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
                        MaterialCommunityIcons.map_marker_outline,
                        color: Colors.red,
                        size: 30,
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
    );
  }
}
