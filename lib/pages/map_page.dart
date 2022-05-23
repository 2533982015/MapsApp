import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MapPage());

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  var markers = {
    Marker(
        markerId: const MarkerId('1'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: const InfoWindow(
            title: 'Suc, salvador del mundo', snippet: 'MovilSV'),
        position: const LatLng(13.700720818864918, -89.22409534458622)),
    Marker(
        markerId: const MarkerId('2'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: const InfoWindow(title: 'Suc, arce', snippet: 'MovilSV'),
        position: const LatLng(13.70001885108788, -89.198177160561970)),
    Marker(
        markerId: const MarkerId('3'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: const InfoWindow(
            title: 'Suc, centro de soyapango', snippet: 'MovilSV'),
        position: const LatLng(13.694009176433218, -89.13702875728684)),
    Marker(
        markerId: const MarkerId('4'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow:
            const InfoWindow(title: 'Suc, san jacinto', snippet: 'MovilSV'),
        position: const LatLng(13.687889969755282, -89.19026354891311)),
  };

  final _center =
      const LatLng(13.695478508868032, -89.21456579946783); //san_salvador

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Maps App'),
            backgroundColor: Colors.amber.shade700),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: markers,
        ),
      ),
    );
  }
}
