import 'package:flutter/material.dart';
import 'package:rutsproj/widgets/widget_text.dart';

class DisplayMap extends StatelessWidget {
  const DisplayMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Get Location'),
      ),
    );
  }
}
