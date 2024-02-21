import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key, required this.title});

  final String title;

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(20.0),),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add Medication',
        child: const Icon(Icons.add),
      ),
    );
  }


}