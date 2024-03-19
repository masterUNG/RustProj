import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rutsproj/utility/app_controller.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  AppController appController = Get.put(AppController());

  var title = <String>['บริการ', 'โปรไฟร์',];
  var iconDatas = <IconData>[Icons.face_2, Icons.person,];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
