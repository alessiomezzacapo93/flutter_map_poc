import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(45.624664, 8.720497),
    zoom: 14,
    bearing: 0,
  );

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(45.624664, 8.720497), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        circles: _createCircle(),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Circle _circle(
      {required String id,
      required int circleId,
      required LatLng center,
      required double radius,
      required Color color,
      required int zIndex}) {
    return Circle(
        circleId: CircleId('${id}_$circleId'),
        center: center,
        radius: radius,
        fillColor: color.withOpacity(0.5),
        strokeWidth: 0,
        consumeTapEvents: true,
        zIndex: zIndex,
        onTap: () {});
  }

  Set<Circle> _createCircle() {
    Map<String, Circle> allCircleMap = {};
    try {
      allCircleMap.putIfAbsent(
        '_1',
        () => _circle(
            id: "circle1",
            circleId: 1,
            center: LatLng(45.63465746853619, 8.723780023834223),
            radius: 100,
            color: Colors.red,
            zIndex: 300),
      );
      allCircleMap.putIfAbsent(
        '_2',
        () => _circle(
            id: "circle1",
            circleId: 2,
            center: LatLng(45.63465746853619, 8.723780023834223),
            radius: 200,
            color: Colors.orange,
            zIndex: 200),
      );
      allCircleMap.putIfAbsent(
        '_3',
        () => _circle(
            id: "circle1",
            circleId: 3,
            center: LatLng(45.63465746853619, 8.723780023834223),
            radius: 400,
            color: Colors.yellow,
            zIndex: 100),
      );
      allCircleMap.putIfAbsent(
        '_4',
        () => _circle(
            id: "circle2",
            circleId: 1,
            center: LatLng(45.63249686955926, 8.723780023834223),
            radius: 100,
            color: Colors.red,
            zIndex: 300),
      );
      allCircleMap.putIfAbsent(
        '_5',
        () => _circle(
            id: "circle2",
            circleId: 2,
            center: LatLng(45.63249686955926, 8.723780023834223),
            radius: 200,
            color: Colors.orange,
            zIndex: 200),
      );
      allCircleMap.putIfAbsent(
        '_6',
        () => _circle(
            id: "circle2",
            circleId: 3,
            center: LatLng(45.63249686955926, 8.723780023834223),
            radius: 400,
            color: Colors.yellow,
            zIndex: 100),
      );
    } catch (err) {
      print(err);
    }
    return allCircleMap.values.toSet();
  }
}
