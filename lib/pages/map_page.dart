import 'package:flutter/material.dart';
import 'package:maps_app/widget/map_widget.dart';

class MapPages extends StatefulWidget {
  const MapPages({Key? key}) : super(key: key);

  @override
  State<MapPages> createState() => _MapPagesState();
}

class _MapPagesState extends State<MapPages> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('App Map'),
        ),
        body: const MapWidget(),
      );
}
