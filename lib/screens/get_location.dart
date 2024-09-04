import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sample_api/models/user.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({super.key, required this.user});

  final User user;

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.user.name.first}\'s Location'),
          centerTitle: true,
        ),
        body: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(double.parse(widget.user.location.coordinates.latitude),
                double.parse(widget.user.location.coordinates.longitude)),
            initialZoom: 6.0,
            minZoom: 5.0,
            onTap: (tapPosition, point) {
              setState(() {
                final mapController = MapController();
                mapController.move(
                    point, mapController.camera.zoom + 2.0); // Increase zoom level by 2
              });
            },
            maxZoom: 20.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(double.parse(widget.user.location.coordinates.latitude),
                      double.parse(widget.user.location.coordinates.longitude)),
                  child: const Icon(Icons.location_on),
                ),
              ],
            ),
          ],
        ));
  }
}
