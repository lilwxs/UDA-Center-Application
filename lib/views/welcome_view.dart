import 'package:flutter/material.dart';
import 'package:uda_std_application/components/welcome/login_form.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  static const String route = '/welcome';

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 126,
              ),
              Center(child: Image.asset('assets/images/logo.png', width: 200)),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 30, right: 30, bottom: 20),
                child: LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
