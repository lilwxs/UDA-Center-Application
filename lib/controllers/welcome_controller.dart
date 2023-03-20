import 'package:get/get.dart';
import 'package:uda_std_application/services/app.service.dart';
import 'package:uda_std_application/views/home_view.dart';
import 'package:uda_std_application/views/welcome_view.dart';

import '../services/user.service.dart';

class WelcomeController extends GetxController {
  RxString mssv = RxString('');
  RxString password = RxString('');

  RxBool showPass = RxBool(false);

  RxBool loading = RxBool(false);

  AppService appService = Get.find<AppService>();

  // LOGIN
  Future<void> login() async {
    if (mssv.isEmpty || password.isEmpty || loading.isTrue) {
      return;
    }
    loading.value = true;
    try {
      String token = await UserService.login(mssv.value, password.value);

      await appService.onLogin(token);

      if (appService.$auth) {
        Get.offNamed(HomeView.route);
      }
    } catch (_) {}
    loading.value = false;
  }

  // FORGOT-PASSWORD
  Future<void> forgotPassword() async {
    if (mssv.isEmpty || loading.isTrue) {
      return;
    }
    loading.value = true;
    try {
      String token = await UserService.forgotPasswordService(mssv.value);
      print("token" + token);
      if (token != null || token != "") {
        Get.offNamed(WelcomeView.route);
      } else {
        return;
      }
    } catch (_) {}
    loading.value = false;
  }

}
