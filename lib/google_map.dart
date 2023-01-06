import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  MyMap({Key? key}) : super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  static final LatLng _kMapCenter =
      LatLng(31.5336,  74.2988);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
                                   height:800,
                                    child:GoogleMap(
        initialCameraPosition: _kInitialPosition,
      ),
                                  ),
    );
  }
}