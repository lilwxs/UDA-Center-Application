import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uda_std_application/controllers/welcome_controller.dart';
import 'package:uda_std_application/theme/color.dart' show kPrimaryColor;
import 'package:uda_std_application/theme/input.dart';

class InputFormWidget extends StatefulWidget {
  const InputFormWidget({Key? key, required this.controller, required this.hintText, this.onChanged}) : super(key: key);

  final TextEditingController controller;
  final ValueSetter<String>? onChanged;
  final String hintText;

  @override
  State<InputFormWidget> createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  final WelcomeController _welcomeController = Get.find<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        style: TextStyle(color: Colors.black.withOpacity(0.8)),
        decoration: kPrimaryInput.copyWith(
          hintText: widget.hintText,
          prefixIcon: Icon(
            Ionicons.at_outline,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
