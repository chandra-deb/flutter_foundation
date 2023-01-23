import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'randomizer_change_notifier.dart';

class GeneratorWidget extends StatelessWidget {
  const GeneratorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generator')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            context
                    .watch<RandomizerChangeNotifier>()
                    .generatedNumber
                    ?.toString() ??
                'Generate',
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<RandomizerChangeNotifier>().generateRandomNumber();
              },
              child: const Text('Generate')),
        ],
      )),
    );
  }
}
