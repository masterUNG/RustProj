// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:rutsproj/widgets/widget_text.dart';

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({
    Key? key,
    required this.head,
    required this.tail,
  }) : super(key: key);

  final String head;
  final String tail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,
          child: WidgetText(data: head),
        ),
        Expanded(flex: 2,
          child: WidgetText(data: tail),
        ),
      ],
    );
  }
}
