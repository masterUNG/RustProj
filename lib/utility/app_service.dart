import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rutsproj/models/data_model.dart';
import 'package:rutsproj/models/user_model.dart';
import 'package:rutsproj/states/main_home.dart';
import 'package:rutsproj/utility/app_constant.dart';
import 'package:rutsproj/utility/app_controller.dart';
import 'package:rutsproj/utility/app_dialog.dart';
import 'package:rutsproj/widgets/widget_button.dart';
import 'package:rutsproj/widgets/widget_image_assets.dart';
import 'package:rutsproj/widgets/widget_text.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> processCheckLogin(
      {required String user, required String password}) async {
    print('## user ---> $user, password = $password');

    Map<String, dynamic> map = {};
    map['username'] = user;
    map['password'] = password;

    await Dio().post(AppConstant.urlApiLogin, data: map).then((value) {
      print('## value --> $value');

      UserModel model = UserModel.fromMap(value.data);

      if (model.status == 'ok') {
        //Login True

        GetStorage().write('user', model.toMap());

        Get.offAll(const MainHome());
      } else {
        Get.snackbar(
          'Login Flase',
          'Please Try Again',
          backgroundColor: GFColors.DANGER,
          colorText: GFColors.WHITE,
        );
      }
    });
  }

  Future<void> processReadAPIwithToken() async {
    Map<String, dynamic> map = GetStorage().read('user');
    UserModel userModel = UserModel.fromMap(map);

    // String token = userModel.token;
    String token = AppConstant.testToken;
    print('##20mar token = $token');

    String urlApi = '${AppConstant.urlApiReadProfile}$token';

    await Dio().get(urlApi).then((value) {

      print('##21mar value form api เพืือเช็ก token --> $value');

      Map<String, dynamic> map = value.data;
      // if (map['status'] == 'ok') {
      if (1 < 2) {
        //OK

        var data = map['data'];
        print('##20mar data ที่ได้จาก api --> $data');

        for (var element in data) {
          DataModel dataModel = DataModel.fromMap(element);
          appController.dataModels.add(dataModel);
        }
      } else {
        AppDialog().normalDialog(
            title: 'Token False',
            iconWidget: const WidgetImageAsset(),
            contentWidget:
                const WidgetText(data: 'Token Expire ?? Please Login Again'),
            firstWidget: WidgetButton(
              text: 'Login Again',
              pressFunc: () async {
                await GetStorage()
                    .erase()
                    .then((value) => Get.offAllNamed('/authen'));
              },
              gfButtonType: GFButtonType.outline,
            ));
      }
    });
  }
}
