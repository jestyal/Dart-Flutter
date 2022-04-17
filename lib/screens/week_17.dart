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

  //разрешение у пользователя
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

  Future<LatLng> _getCenter() async {
    final GoogleMapController controller = await _controller.future;
    LatLngBounds visibleRegion = await controller.getVisibleRegion();
    LatLng centerLatLng = LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
          2,
    );

    return centerLatLng;
  }

  Future<LatLng> _getLocation() async {
    LocationData locationData = await location.getLocation();
    return LatLng(locationData.latitude!, locationData.longitude!);
  }

  Future<void> _goToCurrent(LatLng latLng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 14)));
  }

  Future<void> _addMarker() async {
    final startIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(75, 75)),
        'assets/icons/start_map_pin.png');
    final finishIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(75, 75)),
        'assets/icons/finish_map_pin.png');

    LatLng _currentPosition = await _getLocation();

    _markers.add(Marker(
        markerId: const MarkerId("start"),
        infoWindow: const InfoWindow(title: "Start"),
        // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        icon: startIcon,
        position: _currentPosition));

    LatLng _currentCenter = await _getCenter();

    _markers.add(Marker(
        markerId: const MarkerId("finish"),
        infoWindow: const InfoWindow(title: "Finish"),
        // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        icon: finishIcon,
        position: _currentCenter));

    _polyline.add(Polyline(
      polylineId: const PolylineId("polyline"),
      color: Colors.indigoAccent,
      width: 4,
      points: _markers.map((marker) => marker.position).toList(),
    ));

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map page"),
      ),
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(56.840222, 60.620272),
            zoom: 14,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: _onMapCreated,
          markers: _markers,
          polylines: _polyline,
          // onTap: _addMarker,
        ),
        Center(
          child: Image.asset('assets/icons/map_pin.png', width: 80),
        ),
      ]),
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
                  _addMarker();
                },
                label: const Text('Проложить'),
                // icon: const Icon(Icons.double_arrow_rounded),
                backgroundColor: Colors.indigoAccent,
              )),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    _markers.clear();
                    _polyline.clear();
                  });
                  _getLocation().then((latLng) {
                    _goToCurrent(latLng);
                  });
                },
                label: const Text('Сброс'),
                backgroundColor: Colors.indigoAccent,
              ))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }
}
