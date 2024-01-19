import 'package:flutter/material.dart';

import 'ui/expansion_tile_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Testbed',
      home: ExpansionTileSample(),
    );
  }
}
