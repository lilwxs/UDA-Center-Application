import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:uda_std_application/routes.dart';
import 'package:uda_std_application/services/app.service.dart';
import 'package:uda_std_application/views/home_view.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // log("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initServices();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Delay 2 giây trước khi xóa Splash Screen
  Timer(const Duration(seconds: 0), () {
    FlutterNativeSplash.remove();
  });

  runApp(MyApp());
}

Future<void> initServices() async {
  // Int App, Dio,...
  await Get.putAsync<AppService>(() => AppService().init());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppService appService = Get.find<AppService>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      transitionDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      getPages: RouteGenerator.routes,
      initialRoute: HomeView.route,
    );
  }
}
