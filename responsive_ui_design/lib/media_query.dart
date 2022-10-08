import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Query"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Container(
          color: Colors.amber,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 4,
        ),
      ),
    );
  }
}
