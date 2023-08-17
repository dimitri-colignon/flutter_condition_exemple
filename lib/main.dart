import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Condition exemple',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Condition exemple'),
    );
  }
}

enum Animals { bear, lion, buffalo }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Animals? _animals = Animals.bear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          // *** Liste de choix ...
          RadioListTile(
            title: const Text("Ours"),
            value: Animals.bear,
            groupValue: _animals,
            onChanged: (Animals? value) => setState(() => _animals = value),
          ),
          RadioListTile(
            title: const Text("Lion"),
            value: Animals.lion,
            groupValue: _animals,
            onChanged: (Animals? value) => setState(() => _animals = value),
          ),
          RadioListTile(
            title: const Text("Buffle"),
            value: Animals.buffalo,
            groupValue: _animals,
            onChanged: (Animals? value) => setState(() => _animals = value),
          ),
          const Divider(),
          // *** Condition d'affichage ...
          if (_animals == Animals.bear) ...[
            const Text("Je suis un ours"),
            const Text("et je suis omnivore!"),
          ] else if (_animals == Animals.lion) ...[
            const Text("Je suis un lion"),
            const Text("et je suis carnivore!"),
          ] else ...[
            const Text("Je suis un buffle"),
            const Text("et je suis hervivore!"),
          ],
          // ***
        ],
      ),
    );
  }
}
