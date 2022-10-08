import 'package:dynamic_user_interface/data_table.dart';
import 'package:dynamic_user_interface/grid_view.dart';
import 'package:dynamic_user_interface/list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DataTableExample(),
    );
  }
}
