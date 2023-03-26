import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uda_std_application/controllers/welcome_controller.dart';
import 'package:uda_std_application/theme/color.dart';
import 'package:uda_std_application/theme/input.dart';
import 'package:uda_std_application/views/welcome_view.dart';

class ForgotPass extends StatelessWidget {
  ForgotPass({Key? key}) : super(key: key);

  final WelcomeController c = Get.find<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 126,
          ),
          Center(child: Image.asset('assets/images/logo.png', width: 200)),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: TextField(
                cursorColor: kPrimaryColor,
                onChanged: (String text) => c.mssv.value = text,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.8)),
                decoration: kPrimaryInput.copyWith(
                  hintText: 'MSSV',
                  prefixIcon: Icon(
                    Ionicons.at_outline,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => AnimatedOpacity(
                opacity: c.loading.isTrue ? 0.5 : 1,
                duration: const Duration(milliseconds: 300),
                child: TextButton(
                  onPressed: () {
                    c.forgotPassword();
                    showAlertDialog(context);
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      color: kPrimaryColor,
                      child: Center(
                        child: Text(
                          'Xác nhận'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    const String title = "Thông báo";
    const String content = "Hãy kiểm tra email của bạn.";
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
