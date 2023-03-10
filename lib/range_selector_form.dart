// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int intValue);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                labelText: "Minimum",
                intValueSetter: minValueSetter,
              ),
              const SizedBox(height: 16),
              RangeSelectorTextFormField(
                labelText: "Maximum",
                intValueSetter: maxValueSetter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  final String labelText;
  final IntValueSetter intValueSetter;

  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelText),
      validator: (value) {
        if (value!.isEmpty || int.tryParse(value) == null) {
          return "Only numbers allowed";
        }
        return null;
      },
      onSaved: (newValue) {
        intValueSetter(int.parse(newValue!));
      },
    );
  }
}
