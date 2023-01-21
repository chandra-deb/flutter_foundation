import 'dart:math';

import 'package:flutter/material.dart';

class GeneratorWidget extends StatefulWidget {
  final int minNumber;
  final int maxNumber;

  const GeneratorWidget({
    Key? key,
    required this.minNumber,
    required this.maxNumber,
  }) : super(key: key);

  @override
  State<GeneratorWidget> createState() => _GeneratorWidgetState();
}

class _GeneratorWidgetState extends State<GeneratorWidget> {
  int? generatedNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generator')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            generatedNumber?.toString() ?? 'Generate',
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  generatedNumber = Random().nextInt(widget.maxNumber);
                });
              },
              child: const Text('Generate')),
        ],
      )),
    );
  }
}
