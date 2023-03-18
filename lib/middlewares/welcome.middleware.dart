import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_std_application/services/app.service.dart';
import 'package:uda_std_application/views/home_view.dart';

class WelcomeMiddleware extends GetMiddleware {
  AppService appService = Get.find<AppService>();

  @override
  redirect(String? route) {
    return appService.$auth ? const RouteSettings(name: HomeView.route) : null;
  }
}
