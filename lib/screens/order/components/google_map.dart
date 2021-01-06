import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart' as webMap;
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class GleMap extends StatefulWidget {
  @override
  _GleMapState createState() => _GleMapState();
}

class _GleMapState extends State<GleMap> {
  final Set<Marker> _markers = {
    Marker(
      onTap: () {
        print("tab");
      },
      draggable: true,
      onDragEnd: (value) {
        print(value);
      },
      markerId: MarkerId("jjj"),
      position: _center,
    ),
  };
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        // onMapCreated: ,
        initialCameraPosition: CameraPosition(target: _center, zoom: 15),
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: _markers,
        onCameraMove: (position) {
          // print(_markers);
        },
      ),
    );
  }
}
