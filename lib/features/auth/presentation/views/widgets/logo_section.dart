import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/assets.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'Hogwarts School',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Image.asset(Assets.kLogo, width: 250, height: 250),
        ),
      ],
    );
  }
}
