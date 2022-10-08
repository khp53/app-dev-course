import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherExample extends StatefulWidget {
  const UrlLauncherExample({super.key});

  @override
  State<UrlLauncherExample> createState() => _UrlLauncherExampleState();
}

class _UrlLauncherExampleState extends State<UrlLauncherExample> {
  String _url = "http://learnio.eu";

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw 'cannot launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Url Launcher"),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          onPressed: () => _launchUrl(),
          child: const Text(
            "Launch Url",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
