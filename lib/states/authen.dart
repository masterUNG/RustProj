import 'package:flutter/material.dart';
import 'package:rutsproj/utility/app_constant.dart';
import 'package:rutsproj/widgets/widget_form.dart';
import 'package:rutsproj/widgets/widget_image_assets.dart';
import 'package:rutsproj/widgets/widget_text.dart';

class Authen extends StatelessWidget {
  const Authen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          children: [
            Column(
              children: [
                const WidgetImageAsset(
                  size: 250,
                ),
                WidgetText(
                  data: AppConstant.appName,
                  textStyle: AppConstant().h2Style(),
                ),
                Column(
                  children: [
                    WidgetForm(
                      hint: 'User :',
                      subfixWidget: Icon(Icons.person_outline),
                    ),
                    WidgetForm(
                      hint: 'Password :',
                      obscu: true,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
