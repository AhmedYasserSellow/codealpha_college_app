import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/funcs/generate_password.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/admin/data/repos/admin_repo.dart';

class AdminRepoImpl implements AdminRepo {
  @override
  Future uploadStudentData(
      BuildContext context, StudentModel studentModel) async {
    Reference refRoot = FirebaseStorage.instance.ref();
    Reference refHouse = refRoot.child(studentModel.house);
    Reference refLevel = refHouse.child(studentModel.level);
    Reference refImage = refLevel.child(studentModel.phone);

    try {
      await refImage.putFile(File(studentModel.image));
      await refImage.getDownloadURL().then((value) async {
        final String password = generatePassword();
        await FirebaseFirestore.instance
            .collection(studentModel.house)
            .doc('students')
            .collection(studentModel.level)
            .doc(studentModel.phone)
            .set({
          'name': studentModel.name,
          'image': value,
          'phone': studentModel.phone,
          'level': studentModel.level,
          'house': studentModel.house,
          'password': password,
        });
        await FirebaseFirestore.instance
            .collection('students')
            .doc(studentModel.phone)
            .set({
          'id': studentModel.phone,
          'pw': password,
        });
      });
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'data uploaded successfully',
            style: TextStyle(color: Colors.white),
          ),
        ));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'there was an error , try again later',
            style: TextStyle(color: Colors.white),
          ),
        ));
      }
    }
  }
}
