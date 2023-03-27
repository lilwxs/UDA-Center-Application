// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:uda_std_application/theme/input.dart';
//
// class InputObxFormWidget extends StatefulWidget {
//   const InputObxFormWidget({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     this.onChanged,
//     this.onTap,
//     this.obscureText = false,
//     required this.isIcon,
//   }) : super(key: key);
//
//   final TextEditingController controller;
//   final ValueChanged<String>? onChanged;
//   final bool obscureText;
//   final VoidCallback? onTap;
//   final String hintText;
//   final IconData isIcon;
//
//   @override
//   _InputObxFormWidgetState createState() => _InputObxFormWidgetState();
// }
//
// class _InputObxFormWidgetState extends State<InputObxFormWidget> {
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: Obx(() {
//         // Thay đổi onChanged
//         final onChanged = widget.onChanged ??
//                 (value) {
//               // Nếu onChanged không được cung cấp, thì gọi hàm setState để cập nhật giá trị mới
//               setState(() {
//                 widget.controller.text = value;
//               });
//             };
//
//         return TextField(
//           controller: widget.controller,
//           onChanged: onChanged, // Sử dụng onChanged đã được xử lý
//           obscureText: widget.obscureText,
//           enableSuggestions: false,
//           autocorrect: false,
//           cursorColor: Colors.grey,
//           style: const TextStyle(
//             color: Colors.black87,
//           ),
//           decoration: kPrimaryInput.copyWith(
//             hintText: widget.hintText,
//             // Sử dụng isIcon đã được chuyển thành IconData
//             prefixIcon: Icon(
//               Ionicons.lock_closed_outline,
//               color: Colors.black.withOpacity(0.5),
//             ),
//             suffixIcon: GestureDetector(
//               onTap: widget.onTap,
//               // Sử dụng isIcon đã được chuyển thành IconData
//               child: Icon(
//                 widget.isIcon,
//                 color: Colors.black.withOpacity(0.5),
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
