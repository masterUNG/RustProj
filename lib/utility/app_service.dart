import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rutsproj/models/user_model.dart';
import 'package:rutsproj/states/main_home.dart';
import 'package:rutsproj/utility/app_constant.dart';

class AppService {
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
}
