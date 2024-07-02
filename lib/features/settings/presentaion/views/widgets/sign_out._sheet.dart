import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/assets.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/widgets/sign_out_button.dart';
import 'package:hogwarts_college_app/features/auth/data/repos/auth_repo_impl.dart';

class SignOutSheet extends StatelessWidget {
  const SignOutSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.kSignOut,
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Sign out for a moment',
              style: TextStyle(
                color: NeutralColors.k500,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Are you sure you want to sign out your account for a moment?',
              style: TextStyle(
                color: NeutralColors.k300,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: SignOutButton(
                    textColor: PrimaryColors.main,
                    buttonColor: PrimaryColors.focus,
                    text: 'Cancel',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SignOutButton(
                    text: 'Sign Out',
                    onTap: () {
                      AuthRepoImpl().signOut(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
          ],
        ),
      ),
    );
  }
}
