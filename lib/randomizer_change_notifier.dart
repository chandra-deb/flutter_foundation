import 'dart:math';

import 'package:flutter/foundation.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  int min = 0;
  int max = 0;

  int? _generatedNumber;
  int? get generatedNumber => _generatedNumber;

  void generateRandomNumber() {
    _generatedNumber = min + Random().nextInt(max + 1 - min);
    notifyListeners();
  }
}
