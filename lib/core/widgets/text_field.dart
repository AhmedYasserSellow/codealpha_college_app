import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    this.suffix,
    this.isObscured = false,
    this.onTap,
    this.keyboardType = TextInputType.name,
  });
  final String title;
  final IconData icon;
  final TextEditingController controller;
  final Widget? suffix;
  final bool isObscured;
  final void Function()? onTap;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: NeutralColors.k500,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          keyboardType: keyboardType,
          onTap: onTap,
          obscureText: isObscured,
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: NeutralColors.k200),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: NeutralColors.k200),
              borderRadius: BorderRadius.circular(50),
            ),
            prefixIcon: Icon(
              icon,
              color: NeutralColors.k200,
              size: 16,
            ),
            suffixIcon: suffix,
            hintText: title,
            hintStyle: const TextStyle(
              color: NeutralColors.k200,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
