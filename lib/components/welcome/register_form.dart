import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uda_std_application/components/welcome/login_form.dart';
import 'package:uda_std_application/controllers/welcome_controller.dart';
import 'package:uda_std_application/theme/color.dart';
import 'package:uda_std_application/theme/input.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final WelcomeController c = Get.find<WelcomeController>();
  final TextEditingController idsv = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cfPassword = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController cccd = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController className = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TextField(
                    controller: idsv,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) => {c.idsv.value = value},
                    style: TextStyle(
                      // fontWeight: FontWeight.w500
                        color: Colors.black.withOpacity(0.8)),
                    decoration: kPrimaryInput.copyWith(
                      hintText: 'IDSV',
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
                      onChanged: (value) => {c.password.value = value},
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
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Obx(
                        () => TextField(
                      controller: cfPassword,
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
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TextField(
                    controller: name,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) => {c.name.value = value},
                    style: TextStyle(
                      // fontWeight: FontWeight.w500
                        color: Colors.black.withOpacity(0.8)),
                    decoration: kPrimaryInput.copyWith(
                      hintText: 'Name',
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
                  child: TextField(
                    controller: department,
                    onChanged: (value) => {c.department.value = value},
                    cursorColor: kPrimaryColor,
                    style: TextStyle(
                      // fontWeight: FontWeight.w500
                        color: Colors.black.withOpacity(0.8)),
                    decoration: kPrimaryInput.copyWith(
                      hintText: 'Department',
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
                  child: TextField(
                    controller: cccd,
                    onChanged: (value) => {c.cccd.value = value},
                    cursorColor: kPrimaryColor,
                    style: TextStyle(
                      // fontWeight: FontWeight.w500
                        color: Colors.black.withOpacity(0.8)),
                    decoration: kPrimaryInput.copyWith(
                      hintText: 'CCCD',
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
                  child: TextField(
                    controller: address,
                    onChanged: (value) => {c.address.value = value},
                    cursorColor: kPrimaryColor,
                    style: TextStyle(
                      // fontWeight: FontWeight.w500
                        color: Colors.black.withOpacity(0.8)),
                    decoration: kPrimaryInput.copyWith(
                      hintText: 'Address',
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
                  child: TextField(
                    controller: phone,
                    onChanged: (value) => {c.phone.value = value},
                    cursorColor: kPrimaryColor,
                    style: TextStyle(
                      // fontWeight: FontWeight.w500
                        color: Colors.black.withOpacity(0.8)),
                    decoration: kPrimaryInput.copyWith(
                      hintText: 'Phone',
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
                  child: TextField(
                    controller: className,
                    onChanged: (value) => {c.className.value = value},
                    cursorColor: kPrimaryColor,
                    style: TextStyle(
                      // fontWeight: FontWeight.w500
                        color: Colors.black.withOpacity(0.8)),
                    decoration: kPrimaryInput.copyWith(
                      hintText: 'Class',
                      prefixIcon: Icon(
                        Ionicons.at_outline,
                        color: Colors.black.withOpacity(0.5),
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
                        onPressed: () => {
                          if (idsv.value.text.isEmpty ||
                              password.value.text.isEmpty ||
                              cfPassword.value.text.isEmpty ||
                              name.value.text.isEmpty ||
                              department.value.text.isEmpty ||
                              cccd.value.text.isEmpty ||
                              phone.value.text.isEmpty ||
                              className.value.text.isEmpty)
                            {
                              print("Phải nhập hết các trường"),
                            }
                          else if (password.value.text != cfPassword.value.text)
                            {print("Mật khẩu không giống nhau.")}
                          else
                            {c.register()}
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Obx(
                        () => AnimatedOpacity(
                      opacity: c.loading.isTrue ? 0.5 : 1,
                      duration: const Duration(milliseconds: 300),
                      child: TextButton(
                        onPressed: () =>
                        {Get.to(() => LoginForm()), print('Đăng nhập')},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            color: kTextColor,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
