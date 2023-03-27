import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uda_std_application/theme/color.dart';

class OtpFormWidget extends StatefulWidget {
  const OtpFormWidget({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<OtpFormWidget> createState() => _OtpFormWidgetState();
}

class _OtpFormWidgetState extends State<OtpFormWidget> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isFocused ? kPrimaryColor : Colors.grey,
          width: 1,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: (value) {
          if (value.length == 6) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: const InputDecoration(border: InputBorder.none),
        style: Theme.of(context).textTheme.headline6?.copyWith(
          color: kPrimaryColor,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onTap: () {
          setState(() {
            isFocused = true;
          });
        },
        onSubmitted: (value) {
          setState(() {
            isFocused = false;
          });
        },
      ),
    );
  }
}
