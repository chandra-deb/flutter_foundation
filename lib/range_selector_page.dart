// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'generatorWidget.dart';
import 'range_selector_form.dart';

class RangeSelectorPage extends HookWidget {
  RangeSelectorPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(10);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
        minValueSetter: (intValue) => min.value = intValue,
        maxValueSetter: (intValue) => max.value = intValue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _formKey.currentState?.save();
            print('$min, $max');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    GeneratorWidget(minNumber: min.value, maxNumber: max.value),
              ),
            );
          }
        },
        child: const Icon(Icons.navigate_next_sharp),
      ),
    );
  }
}
