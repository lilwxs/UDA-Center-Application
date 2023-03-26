import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:uda_std_application/components/welcome/forgot_password.dart';
import 'package:uda_std_application/components/welcome/register_form.dart';
import 'package:uda_std_application/controllers/welcome_controller.dart';
import 'package:uda_std_application/theme/color.dart';
import 'package:uda_std_application/views/welcome_view.dart';

import '../../theme/input.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Remember me feature
  bool isChecked = false;
  TextEditingController mssv = TextEditingController();
  TextEditingController password = TextEditingController();
  late Box box1;

  final WelcomeController c = Get.find<WelcomeController>();

  @override
  void initState() {
    super.initState();
    createOpenBox();
  }

  void createOpenBox() async {
    box1 = await Hive.openBox('logindata');
    getdata();
  }

  void getdata() async {
    if (box1.get('mssv') != null) {
      mssv.text = box1.get('mssv');
      isChecked = true;
      setState(() {});
    }
    if (box1.get('password') != null) {
      password.text = box1.get('password');
      isChecked = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: TextField(
              controller: mssv,
              cursorColor: kPrimaryColor,
              style: TextStyle(
                  // fontWeight: FontWeight.w500
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
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Obx(
              () => TextField(
                controller: password,
                obscureText: !c.showPass.isTrue,
                enableSuggestions: false,
                autocorrect: false,
                cursorColor: Colors.grey,
                style: TextStyle(
                    // fontWeight: FontWeight.w500
                    color: Colors.black.withOpacity(0.8)),
                decoration: kPrimaryInput.copyWith(
                  hintText: c.showPass.isTrue ? 'password' : '********',
                  prefixIcon: Icon(Ionicons.lock_closed_outline,
                      color: Colors.black.withOpacity(0.5)),
                  suffixIcon: GestureDetector(
                    onTap: () => c.showPass.value = !c.showPass.value,
                    child: Icon(
                      c.showPass.isTrue
                          ? Ionicons.eye_off_outline
                          : Ionicons.eye_outline,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        isChecked = !isChecked;
                        setState(() {});
                      },
                      activeColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const Text("Nhớ tài khoản.",
                        style: TextStyle(color: kPrimaryColor)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ForgotPass());
                  },
                  child: const Text(
                    'Quên mật khẩu?',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Obx(
              () => AnimatedOpacity(
                opacity: c.loading.isTrue ? 0.5 : 1,
                duration: const Duration(milliseconds: 300),
                child: TextButton(
                  onPressed: () => {
                    login(),
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
                          'Đăng Nhập'.toUpperCase(),
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Obx(
              () => AnimatedOpacity(
                opacity: c.loading.isTrue ? 0.5 : 1,
                duration: const Duration(milliseconds: 300),
                child: TextButton(
                  onPressed: () =>
                      {Get.to(() => RegisterForm()), print('Đăng ký')},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      color: kTextColor,
                      child: Center(
                        child: Text(
                          'Đăng ký'.toUpperCase(),
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

  void login() {
    print(mssv.value.text);
    if (isChecked) {
      box1.put('mssv', mssv.value.text);
      box1.put('password', password.value.text);
    }
    c.mssv.value = mssv.value.text as String;
    c.password.value = password.value.text as String;
    c.login();
  }
}
