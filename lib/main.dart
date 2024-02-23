import 'package:flutter/material.dart';

import 'fix/text_editing_controller_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Testbed',
      home: NewTask(),
    );
  }
}
