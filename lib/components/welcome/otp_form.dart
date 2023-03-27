import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_std_application/components/welcome/phone_number_form.dart';
import 'package:uda_std_application/theme/color.dart';
import 'package:uda_std_application/theme/input.dart';
import 'package:uda_std_application/views/welcome_view.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  bool isFocused = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController smsCode = TextEditingController();

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
                "Nhập mã code",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              const SizedBox(height: 10),
              Text(
                "Vui lòng ghi đúng mã code đã chúng tôi đã gửi!",
                style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  controller: smsCode,
                  keyboardType: TextInputType.phone,
                  cursorColor: kPrimaryColor,
                  style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  decoration: kPrimaryInput.copyWith(
                    hintText: 'Mã code',
                    prefixIcon: Icon(
                      Icons.call,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: TextButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential = PhoneAuthProvider
                          .credential(verificationId: PhoneNumberForm.verify,
                          smsCode: smsCode.text);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      Get.toNamed(WelcomeView.route);
                    } catch (e) {
                      print('LỖI OTP CODE!');
                    }
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
                          'Gửi mã'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text('Yêu cầu'),
              //     InkWell(
              //       onTap: () async {
              //         try {
              //           // Gửi lại mã xác thực cho số điện thoại đã nhập
              //           await auth.verifyPhoneNumber(phoneNumber: // Số điện thoại cần xác thực,
              //               timeout: const Duration(seconds:
              //               60), // Thời gian chờ để gửi lại mã xác thực (đơn vị giây)
              //         verificationCompleted: (PhoneAuthCredential credential) async {
              //         // Xử lý khi xác thực hoàn tất (thường không xảy ra trong trường hợp này)
              //         await auth.signInWithCredential(credential);
              //         Get.toNamed(WelcomeView.route);
              //         },
              //         verificationFailed: (FirebaseAuthException e) {
              //         // Xử lý khi xác thực thất bại
              //         print('LỖI GỬI LẠI MÃ OTP!');
              //         },
              //         codeSent: (String verificationId, int? resendToken) {
              //         // Xử lý khi gửi lại mã xác thực thành công
              //         // Lưu verificationId vào biến để sử dụng lại khi người dùng nhập lại mã OTP
              //         PhoneNumberForm.verify = verificationId;
              //         print('Đã gửi lại mã xác thực');
              //         },
              //         codeAutoRetrievalTimeout: (String verificationId) {
              //         // Xử lý khi thời gian chờ gửi lại mã xác thực kết thúc
              //         PhoneNumberForm.verify = verificationId;
              //         print('Đã hết thời gian chờ, vui lòng gửi lại mã xác thực');
              //         },
              //         );
              //         } catch (e) {
              //         print('LỖI GỬI LẠI MÃ OTP!');
              //         }
              //       },
              //       child: Text(
              //         ' Gửi lại mã OTP',
              //         style: TextStyle(
              //           color: kPrimaryColor,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ]
        ),
      ),
    );

  }
}
