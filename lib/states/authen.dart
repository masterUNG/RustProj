import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rutsproj/utility/app_constant.dart';
import 'package:rutsproj/utility/app_controller.dart';
import 'package:rutsproj/utility/app_service.dart';
import 'package:rutsproj/widgets/widget_button.dart';
import 'package:rutsproj/widgets/widget_form.dart';
import 'package:rutsproj/widgets/widget_icon_button.dart';
import 'package:rutsproj/widgets/widget_image_assets.dart';
import 'package:rutsproj/widgets/widget_text.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //นี่คือ Dependeccy สำหรับ Call ตัวแปรที่อยูใน Controller
  AppController appController = Get.put(AppController());

  // คือค่า key ที่ใช้จับการเปลี่ยนแปลงของ WidgetForm
  final keyForm = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ListView(
            children: [
              Column(
                children: [
                  displayImage(),
                  displayAppName(),
                  pathForm(),
                  loginButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container loginButton() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: 250,
      child: WidgetButton(
        text: 'Login',
        pressFunc: () {
          if (keyForm.currentState!.validate()) {
            context.loaderOverlay.show();

            AppService()
                .processCheckLogin(
                    user: userController.text,
                    password: passwordController.text)
                .then((value) => context.loaderOverlay.hide());
          }
        },
      ),
    );
  }

  Widget pathForm() {
    return Form(
      key: keyForm,
      child: Column(
        children: [
          WidgetForm(
            textEditingController: userController,
            validateFunc: (p0) {
              if (p0?.isEmpty ?? true) {
                return 'Please Fill User';
              } else {
                return null;
              }
            },
            hint: 'User :',
            subfixWidget: const Icon(Icons.person_outline),
          ),
          Obx(() {
            return WidgetForm(
              textEditingController: passwordController,
              validateFunc: (p0) {
                if (p0?.isEmpty ?? true) {
                  return 'Please Fill Password';
                } else {
                  return null;
                }
              },
              hint: 'Password :',
              obscu: appController.redEye.value,
              subfixWidget: WidgetIconButton(
                iconData: appController.redEye.value
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined,
                pressFunc: () {
                  appController.redEye.value = !appController.redEye.value;
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  WidgetText displayAppName() {
    return WidgetText(
      data: AppConstant.appName,
      textStyle: AppConstant().h2Style(),
    );
  }

  WidgetImageAsset displayImage() {
    return const WidgetImageAsset(
      size: 250,
    );
  }
}
