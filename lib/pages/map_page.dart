import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(const MapPage());

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final _center =
      const LatLng(13.695478508868032, -89.21456579946783); //san_salvador

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("sucursales").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            var puntos = streamSnapshot.data!.docs
                .map((doc) => Marker(
                    markerId: MarkerId(doc['nombre']),
                    icon: BitmapDescriptor.defaultMarkerWithHue(doc['color'].toDouble()),
                    infoWindow: InfoWindow(
                        title: doc['nombre'], snippet: doc['descripcion']),
                    position: LatLng(
                        doc['ubicacion'].latitude, doc['ubicacion'].longitude)))
                .toList();

            return Scaffold(
              appBar: AppBar(
                  title: const Text('Maps App'),
                  backgroundColor: Colors.amber.shade700),
              body: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                markers: Set.from(puntos),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
