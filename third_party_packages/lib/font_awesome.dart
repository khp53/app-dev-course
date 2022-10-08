// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwesomeExample extends StatelessWidget {
  const FontAwesomeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Font Awesome"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(children: const [
          FaIcon(
            FontAwesomeIcons.droplet,
          ),
          SizedBox(
            height: 20,
          ),
          FaIcon(
            FontAwesomeIcons.gift,
          ),
          SizedBox(
            height: 20,
          ),
          FaIcon(
            FontAwesomeIcons.hand,
          ),
        ]),
      ),
    );
  }
}
