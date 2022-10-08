import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  List cars = [
    {
      "id": "1",
      "name": "Toyota",
      "color": "White",
    },
    {
      "id": "2",
      "name": "Audi",
      "color": "Red",
    },
    {
      "id": "3",
      "name": "Ford",
      "color": "Grey",
    },
    {
      "id": "4",
      "name": "BMW",
      "color": "Black",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text("Id"),
            ),
            DataColumn(
              label: Text("Name"),
            ),
            DataColumn(
              label: Text("Color"),
            ),
          ],
          rows: cars
              .map(
                (e) => DataRow(
                  cells: [
                    DataCell(
                      Text(
                        e['id'],
                      ),
                    ),
                    DataCell(
                      Text(
                        e['name'],
                      ),
                    ),
                    DataCell(
                      Text(
                        e['color'],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
