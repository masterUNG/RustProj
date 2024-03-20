import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rutsproj/states/display_map.dart';
import 'package:rutsproj/utility/app_dialog.dart';
import 'package:rutsproj/widgets/widget_button.dart';
import 'package:rutsproj/widgets/widget_image_assets.dart';
import 'package:rutsproj/widgets/widget_text.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConstant {
  //field

  static String webSite = 'https://www.androidthai.in.th';

  static List<String> paths = <String>[
    'images/service1.png',
    'images/service2.png',
    'images/service3.png',
    'images/service4.png',
    'images/service5.png',
  ];
  static List<String> titles = <String>[
    'Internet',
    'Location',
    'My App',
    'Service4',
    'Service5',
  ];

  static List<Function()> tapFuncs = <Function()>[
    () {
      AppDialog().normalDialog(
          title: 'Goto WebSite',
          iconWidget: WidgetImageAsset(
            path: paths[0],
          ),
          contentWidget: const WidgetText(data: 'Please Tap WebSite'),
          secondWidget: WidgetButton(
            text: 'WebSite',
            pressFunc: () async {
              Get.back();
              final Uri uri = Uri.parse(webSite);
              if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                throw 'Url False';
              }
            },
          ));
    },
    () {
      Get.to(const DisplayMap());
    },
    () {
      AppDialog().normalDialog(
          title: 'Goto My App',
          iconWidget: WidgetImageAsset(
            path: paths[2],
          ),
          contentWidget: const WidgetText(data: 'Please Tap My App'),
          secondWidget: WidgetButton(
            text: 'My App',
            pressFunc: () async {
              Get.back();

              await LaunchApp.openApp(
                androidPackageName: 'com.yingyong.xstream',
              );
            },
          ));
    },
    () {},
    () {},
  ];

  static String appName = 'RUTS Admin';
  static String urlApiLogin = 'https://api.rmutsv.ac.th/elogin';
  static String urlApiReadProfile =
      'https://api.rmutsv.ac.th/personal/academic/';

  static String testToken =
      'varutcha.c:4Mq9NGfxCTLEBrIQ2W9zre7MkuVosRYnRryrYbX2cERZKmTddmoXkIwNFgg6wL5l';

  //method

  TextStyle h1Style() {
    return const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }
}
