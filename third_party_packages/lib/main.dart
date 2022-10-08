import 'package:flutter/material.dart';
import 'package:third_party_packages/cached_net_img.dart';
import 'package:third_party_packages/font_awesome.dart';
import 'package:third_party_packages/url_launcher.dart';
import 'package:third_party_packages/web_view.dart';

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
      home: const UrlLauncherExample(),
    );
  }
}
