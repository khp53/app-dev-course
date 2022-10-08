import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constrains) {
            if (constrains.maxWidth > 1400) {
              return _webLayout();
            } else {
              return _mobileLayout();
            }
          },
        ),
      ),
    );
  }

  Row _webLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(
                minHeight: 100,
                maxHeight: 500,
                maxWidth: 900,
              ),
              color: Colors.blueAccent,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "This is a Layout Builder Example",
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 200,
              width: 450,
              color: Colors.blueAccent,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 450,
              color: Colors.blueAccent,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 450,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ],
    );
  }

  Widget _mobileLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: 100,
              maxHeight: 500,
              maxWidth: 900,
            ),
            color: Colors.blueAccent,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "This is a Layout Builder Example",
            style: TextStyle(fontSize: 40),
          ),
          Container(
            height: 200,
            width: 450,
            color: Colors.blueAccent,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            width: 450,
            color: Colors.blueAccent,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            width: 450,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
