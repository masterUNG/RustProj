// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.hint,
    this.subfixWidget,
    this.obscu,
    this.validateFunc,
    this.textEditingController,
  }) : super(key: key);

  final String? hint;
  final Widget? subfixWidget;
  final bool? obscu;
  final String? Function(String?)? validateFunc;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(controller: textEditingController,
        validator: validateFunc,
        obscureText: obscu ?? false,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 88, 70, 70).withOpacity(0.25),
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: subfixWidget,
        ),
      ),
    );
  }
}
