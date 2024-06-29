import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({
    super.key,
    required this.snapshot,
  });
  final QueryDocumentSnapshot<Map<String, dynamic>> snapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: SecondaryColors.main,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      child: Text(
        snapshot.id,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: SecondaryColors.main,
          fontSize: 20,
        ),
      ),
    );
  }
}
