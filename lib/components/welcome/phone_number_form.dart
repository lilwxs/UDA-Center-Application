import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uda_std_application/components/welcome/otp_form.dart';
import 'package:uda_std_application/controllers/welcome_controller.dart';
import 'package:uda_std_application/theme/color.dart';
import 'package:uda_std_application/theme/input.dart';

class PhoneNumberForm extends StatefulWidget {
  const PhoneNumberForm({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final WelcomeController c = Get.find<WelcomeController>();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+84";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Nhập số điện thoại của bạn",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              const SizedBox(height: 10),
              Text(
                "Vui lòng ghi đúng số điện thoại có trong tài khoản của bạn!",
                style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  cursorColor: kPrimaryColor,
                  style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  decoration: kPrimaryInput.copyWith(
                    hintText: 'Số điện thoại',
                    prefixIcon: Icon(
                      Icons.call,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Obx(
                      () => AnimatedOpacity(
                    opacity: c.loading.isTrue ? 0.5 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: countryController.text +
                              phoneNumberController.text,
                          verificationCompleted: (
                              PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            PhoneNumberForm.verify = verificationId;
                            Get.to(() => OtpForm());
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
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
            ]
        ),
      ),
    );
  }
}

