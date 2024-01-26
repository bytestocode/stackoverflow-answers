import 'package:flutter/material.dart';

import 'fix/exceed_tab_length.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Testbed',
      home: ExceedTabLength(),
    );
  }
}
