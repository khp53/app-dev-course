import 'package:firebase/services/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _services = FirebaseDatabase();
  Stream? brandStream;
  Stream? todoStream;

  final _addController = TextEditingController();

  getBrands() {
    setState(() {
      brandStream = _services.getBrands();
    });
  }

  getUserTodo() {
    setState(() {
      todoStream = _services.getTodoFoUser();
    });
  }

  @override
  void initState() {
    super.initState();
    getBrands();
    getUserTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home"),
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: taskList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              children: [
                TextFormField(
                  controller: _addController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "This field cannot be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Add Tasks",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    var res = _services.addTasks(_addController.text.trim());
                    res
                        .then(
                          (val) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Task Added!"),
                            ),
                          ),
                        )
                        .catchError(
                          (error) => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(error.toString()),
                            ),
                          ),
                        );
                    _addController.clear();
                    Navigator.pop(context);
                  },
                  color: Colors.lightBlue,
                  child: const Text("Add you tasks!"),
                ),
              ],
            ),
          ),
        ),
        label: const Text("Add Tasks"),
      ),
    );
  }

  StreamBuilder<dynamic> homeList() {
    return StreamBuilder(
      stream: brandStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data!.docs[index]['name']),
                subtitle: Text(snapshot.data!.docs[index]['industry']),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  StreamBuilder<dynamic> taskList() {
    return StreamBuilder(
      stream: todoStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(snapshot.data!.docs[index]['title']),
                activeColor: Colors.green,
                checkColor: Colors.white,
                selected: snapshot.data!.docs[index]['isCompleted'],
                value: snapshot.data!.docs[index]['isCompleted'],
                onChanged: (value) {
                  var res = _services.completeTask(
                      true, snapshot.data!.docs[index].id);
                  res
                      .then(
                        (val) => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Task Completed!"),
                          ),
                        ),
                      )
                      .catchError(
                        (error) => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error.toString()),
                          ),
                        ),
                      );
                },
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
