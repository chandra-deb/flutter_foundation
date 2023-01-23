// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'generatorWidget.dart';
import 'range_selector_form.dart';

class RangeSelectorPage extends StatelessWidget {
  RangeSelectorPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const GeneratorWidget(),
              ),
            );
          }
        },
        child: const Icon(Icons.navigate_next_sharp),
      ),
    );
  }
}
