import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PillBoxPage extends StatefulWidget {
  const PillBoxPage({super.key, required this.title});

  final String title;

  @override
  State<PillBoxPage> createState() => _PillBoxPageState();
}

class _PillBoxPageState extends State<PillBoxPage> {
  final daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  Map<String, List<String>> medMap = {
    'Monday': ['8:00 AM | Adderall', '8:00 PM | Adderall'],
    'Tuesday': ['8:00 AM | Insulin', '8:00 PM | Adderall'],
    'Wednesday': ['8:00 AM | Tylenol', '8:00 PM | Adderall'],
    'Thursday': [
      '8:00 AM | Heroin',
      '12:00 AM | Insulin',
      '8:00 PM | Adderall'
    ],
    'Friday': ['8:00 AM | Cocaine', '8:00 PM | Adderall'],
    'Saturday': ['8:00 AM | Protein Shake', '8:00 PM | Adderall'],
    'Sunday': ['8:00 AM | Adderall', '8:00 PM | Adderall'],
  };

  BoxDecoration myBoxDecoration(Color c) {
    return BoxDecoration(
      border: Border(
        left: BorderSide(
          //                   <--- left side
          color: c,
          width: 3.0,
        ),
        bottom: BorderSide(
          //                    <--- top side
          color: c,
          width: 3.0,
        ),
      ),
      borderRadius: const BorderRadius.all(
          Radius.circular(5.0) //                 <--- border radius here
          ),
    );
  }

  Column medicationForWeek(String dotw) {
    return Column(children: [
      Text(dotw,
          style: const TextStyle(
              fontSize: 15, color: Colors.teal, fontWeight: FontWeight.bold)),
      ListView.separated(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: medMap[dotw]!.length,
        itemBuilder: (BuildContext context, int index) {
          return Text("${medMap[dotw]![index]}",
              style: const TextStyle(color: Colors.blueGrey));
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )
    ]);
  }

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: daysOfWeek.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: index == 0
                    ? myBoxDecoration(Colors.teal.shade600)
                    : myBoxDecoration(Colors.teal.shade100),
                child: medicationForWeek(
                    daysOfWeek[(index + DateTime.now().weekday - 1) % 7]));
          },
        )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Scan for Pill',
        child: const Icon(Icons.camera_enhance),
      ),
    );
  }
}
