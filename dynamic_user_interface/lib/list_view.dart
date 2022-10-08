import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  List<String> names = ["a", "b", "c", "d"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: names.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: ListTile(
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("asdas $index"),
                    ),
                  ),
                  leading: const Icon(Icons.abc),
                  trailing: const Icon(Icons.arrow_forward),
                  tileColor: const Color.fromARGB(255, 234, 234, 234),
                  title: Text(names[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
