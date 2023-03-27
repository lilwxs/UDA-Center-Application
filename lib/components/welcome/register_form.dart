import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uda_std_application/components/welcome/widgets/input_form_widget.dart';
import 'package:uda_std_application/components/welcome/widgets/input_obx_form_widget.dart';
import 'package:uda_std_application/controllers/welcome_controller.dart';
import 'package:uda_std_application/theme/color.dart';
import 'package:uda_std_application/theme/input.dart';

import '../../views/welcome_view.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final WelcomeController c = Get.find<WelcomeController>();
  late final TextEditingController idsv = TextEditingController();
  late final TextEditingController password = TextEditingController();
  late final TextEditingController cfPassword = TextEditingController();
  late final TextEditingController name = TextEditingController();
  late final TextEditingController department = TextEditingController();
  late final TextEditingController cccd = TextEditingController();
  late final TextEditingController address = TextEditingController();
  late final TextEditingController phone = TextEditingController();
  late final TextEditingController className = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputFormWidget(
                      controller: idsv,
                      hintText: 'IDSV',
                      onChanged: (value) => c.idsv.value = value,
                    ),
                    const SizedBox(height: 20),
                    InputFormWidget(
                      controller: className,
                      hintText: 'Class',
                      onChanged: (value) => c.className.value = value,
                    ),
                    const SizedBox(height: 20),
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
                    InputFormWidget(
                        controller: name,
                        onChanged: (value) => {c.name.value = value},
                        hintText: 'Name'),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(
                        controller: department,
                        onChanged: (value) => {c.department.value = value},
                        hintText: 'Department'),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(
                        controller: cccd,
                        onChanged: (value) => {c.cccd.value = value},
                        hintText: 'CCCD'),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(
                        controller: address,
                        onChanged: (value) => {c.address.value = value},
                        hintText: 'Address'),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(
                        controller: phone,
                        onChanged: (value) => {c.phone.value = value},
                        hintText: 'Phone'),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 10),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Bạn đã có tài khoản?'),
                        InkWell(
                          onTap: () {
                            Get.to(() => WelcomeView.route);
                          },
                          child: const Text(
                            ' Đăng nhập',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
