import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GeneratorWidget extends HookWidget {
  final int minNumber;
  final int maxNumber;

  const GeneratorWidget({
    Key? key,
    required this.minNumber,
    required this.maxNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final generatedNumber = useState<int?>(null);
    return Scaffold(
      appBar: AppBar(title: const Text('Generator')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            generatedNumber.value?.toString() ?? 'Generate',
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
              onPressed: () {
                generatedNumber.value =
                    minNumber + Random().nextInt(maxNumber + 1 - minNumber);
              },
              child: const Text('Generate')),
        ],
      )),
    );
  }
}
