import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  Location location = Location();
  late GoogleMapController _mapController;
  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController mapController) {
    _controller.complete(mapController);
    _mapController = mapController;
  }

  _checkLocationPermission() async {
    bool locationServiceEnabled = await location.serviceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await location.requestService();
      if (!locationServiceEnabled) {
        return;
      }
    }

    PermissionStatus locationForAppStatus = await location.hasPermission();
    if (locationForAppStatus == PermissionStatus.denied) {
      await location.requestPermission();
      locationForAppStatus = await location.hasPermission();
      if (locationForAppStatus != PermissionStatus.granted) {
        return;
      }
    }
    LocationData locationData = await location.getLocation();
    _mapController.moveCamera(CameraUpdate.newLatLng(
        LatLng(locationData.latitude!, locationData.longitude!)));
  }

  Future<void> _addMarker(LatLng position) async {
    final startIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(32, 32)), 'assets/icons/start_map_pin.png');
    final finishIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(32, 32)), 'assets/icons/finish_map_pin.png');

    if (_markers.isEmpty) {
      _markers.add(Marker(
          markerId: const MarkerId("start"),
          infoWindow: const InfoWindow(title: "Start"),
          // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          icon: startIcon,
          position: position)
      );
    } else {
      _markers.add(Marker(
          markerId: const MarkerId("finish"),
          infoWindow: const InfoWindow(title: "Finish"),
          // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          icon: finishIcon,
          position: position)
      );

      _polyline.removeWhere((element) => element.polylineId.value == "polyline");
      _polyline.add(Polyline(
        polylineId: const PolylineId("polyline"),
        color: Colors.indigoAccent,
        width: 4,
        points: _markers.map((marker) => marker.position).toList(),
      ));
    }
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    _checkLocationPermission();
  }


  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  static const CameraPosition _moscow = CameraPosition(
    target: LatLng(55.7517769362014, 37.61637210845947),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map page"),
      ),
      body: GoogleMap(
        initialCameraPosition: _moscow,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: _onMapCreated,
        markers: _markers,
        polylines: _polyline,
        onTap: _addMarker,
      ),
      floatingActionButton: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    _markers.clear();
                    _polyline.clear();
                  });
                },
                label: const Text('Reset'),
                icon: const Icon(Icons.double_arrow_rounded),
                backgroundColor: Colors.green,
              )),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    _markers.clear();
                    _polyline.clear();
                  });
                },
                label: const Text('Continue'),
                backgroundColor: Colors.green,
              ))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }
}

// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapPage extends StatefulWidget {
//   const MapPage({Key? key}) : super(key: key);
//
//   @override
//   State<MapPage> createState() => MapPageState();
// }
//
// class MapPageState extends State<MapPage> {
//   final Set<Marker> _markers = {};
//   final Set<Polygon> _poly = {};
//   final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;
//   final Completer<GoogleMapController> _controller = Completer();
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       loadMarkers();
//       loadPoly();
//     });
//     _getCurrent();
//   }
//
//   static const CameraPosition _moscow = CameraPosition(
//     target: LatLng(55.7517769362014, 37.61637210845947),
//     zoom: 14.4746,
//   );
//   static const CameraPosition _home = CameraPosition(
//     target: LatLng(55.69839803841039, 37.76223599910736),
//     zoom: 14.4746,
//   );
//
//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(55.69277766693856, 37.781639099121094),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//   Future loadMarkers() async {
//     var jsonData = await rootBundle.loadString('coords/points.json');
//     var data = json.decode(jsonData);
//     final treeIcon = await BitmapDescriptor.fromAssetImage(
//         const ImageConfiguration(size: Size(32, 32)), 'assets/icons/tree.svg');
//
//     data["coords"].forEach((item) {
//       _markers.add(Marker(
//           markerId: MarkerId(item["ID"]),
//           position: LatLng(
//               double.parse(item["latitude"]), double.parse(item["longitude"])),
//           infoWindow: InfoWindow(
//             title: item["comment"],
//           ),
//           icon: BitmapDescriptor.defaultMarkerWithHue(
//             BitmapDescriptor.hueGreen)));
//           // icon: treeIcon));
//     });
//   }
//
//   Future loadPoly() async {
//     List<LatLng> polygonCoords = [];
//     var jsonData = await rootBundle.loadString('coords/poly.json');
//     var data = json.decode(jsonData);
//
//     data["coords"].forEach((item) {
//       polygonCoords.add(LatLng(
//           double.parse(item["latitude"]), double.parse(item["longitude"])));
//     });
//
//     _poly.add(Polygon(
//       polygonId: PolygonId(data["ID"]),
//       points: polygonCoords,
//       strokeColor: Colors.green,
//       fillColor: Colors.green.withOpacity(0.5),
//       strokeWidth: 2,
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: GoogleMap(
//           myLocationEnabled: true,
//           myLocationButtonEnabled: true,
//           mapType: MapType.hybrid,
//           initialCameraPosition: _moscow,
//           markers: Set.from(_markers),
//           polygons: Set.from(_poly),
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//           },
//           onTap: _handleTap,
//         ),
//         floatingActionButton: Row(
//           children: [
//             Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 10),
//                 child: FloatingActionButton.extended(
//                   onPressed: _goToTheLake,
//                   label: const Text('To the lake!'),
//                   icon: const Icon(Icons.double_arrow_rounded),
//                   backgroundColor: Colors.green,
//                 )),
//             Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 20),
//                 child: FloatingActionButton.extended(
//                   onPressed: _goHome,
//                   label: const Text('Return home'),
//                   backgroundColor: Colors.green,
//                 ))
//           ],
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//         )
//     );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
//
//   Future<void> _goHome() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_home));
//   }
//
//   Future<void> _handleTap(LatLng point) async {
//     final treeIcon = await BitmapDescriptor.fromAssetImage(
//         const ImageConfiguration(size: Size(32, 32)), 'assets/icons/tree.svg');
//     debugPrint(point.toString());
//     setState(() {
//       _markers.add(Marker(
//           markerId: MarkerId((_markers.length + 1).toString()),
//           position: LatLng(point.latitude, point.longitude),
//           infoWindow: const InfoWindow(
//             title: "new tree, planted by me",
//           ),
//           icon: treeIcon));
//     });
//   }
//
//   Future<void> _getCurrent() async {
//     _geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//         .then((Position position) async {
//       final GoogleMapController controller = await _controller.future;
//       controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         target: LatLng(position.latitude, position.longitude),
//         zoom: 14.4746,
//       )));
//     }).catchError((e) {
//       print(e);
//     });
//   }
// }
