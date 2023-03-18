import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_std_application/services/app.service.dart';
import 'package:uda_std_application/views/welcome_view.dart';

class AuthMiddleware extends GetMiddleware {
  AppService appService = Get.find<AppService>();

  @override
  redirect(String? route) {
    return !appService.$auth && route != WelcomeView.route
        ? const RouteSettings(name: WelcomeView.route)
        : null;
  }
}
