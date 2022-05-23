import 'package:flutter/material.dart';
import 'package:maps_app/pages/map_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Map App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MapPages(),
      );
}