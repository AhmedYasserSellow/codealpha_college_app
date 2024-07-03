import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.password,
  });

  final String password;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  IconData eyeIcon = FontAwesomeIcons.eyeSlash;
  bool isHidden = true;
  void changeObscure() {
    setState(() {
      eyeIcon = eyeIcon == FontAwesomeIcons.eyeSlash
          ? FontAwesomeIcons.eye
          : FontAwesomeIcons.eyeSlash;
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      suffix: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              changeObscure();
            },
            icon: Icon(
              eyeIcon,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      isObscured: isHidden,
      readOnly: true,
      title: 'Password',
      icon: FontAwesomeIcons.lock,
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: widget.password,
        ),
      ),
    );
  }
}
