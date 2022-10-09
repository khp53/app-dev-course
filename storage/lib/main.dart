import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: const MyHomePage(title: 'Storage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String myName = "Karimul";
  String getFromPref = 'Nothing to show!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The value you want to store is:',
            ),
            Text(
              myName,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                pref.setString('name', myName);
              },
              color: Colors.greenAccent,
              child: const Text("Store Value"),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Your stored content is:',
            ),
            Text(
              getFromPref.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                if (pref.getString('name') != null) {
                  setState(() {
                    getFromPref = pref.getString('name')!;
                  });
                }
              },
              color: Colors.blueAccent,
              child: const Text("Get Store Value"),
            ),
          ],
        ),
      ),
    );
  }
}
