import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rutsproj/utility/app_controller.dart';
import 'package:rutsproj/widgets/body_profile.dart';
import 'package:rutsproj/widgets/body_service.dart';
import 'package:rutsproj/widgets/widget_text.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  AppController appController = Get.put(AppController());

  var titles = <String>[
    'บริการ',
    'โปรไฟร์',
  ];
  var iconDatas = <IconData>[
    Icons.face_2,
    Icons.person,
  ];
  var bodys = <Widget>[
    const BodyService(),
    const BodyProfile(),
  ];

  var items = <BottomNavigationBarItem>[];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < titles.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(iconDatas[i]),label: titles[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: WidgetText(data: titles[appController.indexBody.value]),
          ),
          body: bodys[appController.indexBody.value],
          bottomNavigationBar: BottomNavigationBar(
            items: items,
            onTap: (value) {
              appController.indexBody.value = value;
            },
            currentIndex: appController.indexBody.value,
          ),
        ));
  }
}
