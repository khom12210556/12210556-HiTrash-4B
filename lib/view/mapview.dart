import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:hitrash/providers/mapprovider.dart';
import 'package:flutter_map/flutter_map.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider = context.read<MapProvider>();
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: Provider.latLng,
              onMapReady: () {
                Provider.mapReady = true;
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
                    point: Provider.latLng,
                    builder: (context) {
                      return Icon(
                        MaterialCommunityIcons.map_marker_outline,
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
        ],
      ),
    );
  }
}
