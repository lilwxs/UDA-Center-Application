import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_std_application/controllers/welcome_controller.dart';
import 'package:uda_std_application/theme/color.dart';

import '../../views/welcome_view.dart';

class NewPasswordForm extends StatelessWidget {
  NewPasswordForm({Key? key}) : super(key: key);
  final WelcomeController c = Get.find<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: IconButton(
              splashRadius: double.infinity,
              onPressed: () {
                c.forgotPassword();
                showAlertDialog(context);
              },icon: const Icon(Icons.cloud_download_outlined),
            ),
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    const String title = "Thông báo";
    const String content = "Đã xét về mật khẩu mặc định.";
    const String okButtonText = "OK";

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text(okButtonText),
          onPressed: () {
            Get.offNamed(WelcomeView.route);
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
