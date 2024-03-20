import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rutsproj/utility/app_constant.dart';
import 'package:rutsproj/utility/app_controller.dart';
import 'package:rutsproj/utility/app_service.dart';
import 'package:rutsproj/widgets/widget_text.dart';
import 'package:rutsproj/widgets/widget_title.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({super.key});

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();

    AppService().processReadAPIwithToken();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => appController.dataModels.isEmpty
        ? const SizedBox()
        : ListView(padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              WidgetText(
                data:
                    '${appController.dataModels.last.prefix} ${appController.dataModels.last.fname} ${appController.dataModels.last.lname}',
                textStyle: AppConstant().h2Style(),
              ),
              WidgetTitle(
                  head: 'Position :',
                  tail: appController.dataModels.last.aposition),
              WidgetTitle(
                  head: 'Campus :',
                  tail: appController.dataModels.last.campusname),
              WidgetTitle(
                  head: 'Faculty :',
                  tail: appController.dataModels.last.facultyname),
              WidgetTitle(
                  head: 'Department :',
                  tail: appController.dataModels.last.departmentname),
              WidgetTitle(
                  head: 'Seciton :',
                  tail: appController.dataModels.last.sectionname),
              WidgetTitle(
                  head: 'Gender',
                  tail: appController.dataModels.last.gender),
            ],
          ));
  }
}
