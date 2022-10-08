import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GridViewExample extends StatefulWidget {
  const GridViewExample({super.key});

  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  List<String> cars = ["Toyota", "Lexus", "Proton", "Tata", "Nissan", "Audi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: cars.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 20.0,
          ),
          itemBuilder: (context, index) => Container(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridTile(
                header: Text(index.toString()),
                footer: const Text('sad'),
                child: Center(child: Text(cars[index])),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
