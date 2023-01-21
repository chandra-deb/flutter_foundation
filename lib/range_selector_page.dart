// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'generatorWidget.dart';
import 'range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({Key? key}) : super(key: key);

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final _formKey = GlobalKey<FormState>();

  int min = 10;
  int max = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
        minValueSetter: (intValue) => min = intValue,
        maxValueSetter: (intValue) => max = intValue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _formKey.currentState?.save();
            print('$min, $max');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    GeneratorWidget(minNumber: min, maxNumber: max)));
          }
        },
        child: const Icon(Icons.navigate_next_sharp),
      ),
    );
  }
}
