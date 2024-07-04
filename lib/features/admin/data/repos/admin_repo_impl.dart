import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/funcs/generate_password.dart';
import 'package:hogwarts_college_app/features/events/data/models/event_model.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/admin/data/repos/admin_repo.dart';
import 'package:hogwarts_college_app/features/settings/data/models/admin_model.dart';
import 'package:intl/intl.dart';

class AdminRepoImpl implements AdminRepo {
  @override
  Future uploadStudentData(
      BuildContext context, StudentModel studentModel) async {
    Reference refRoot = FirebaseStorage.instance.ref();
    Reference refHouse = refRoot.child(studentModel.house);
    Reference refLevel = refHouse.child(studentModel.level);
    Reference refImage = refLevel.child(studentModel.phone);
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
        'house': studentModel.house,
        'level': studentModel.level,
        'image': value,
      });
    });
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          'data uploaded successfully',
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
  }

  @override
  Future uploadEventData(BuildContext context, EventModel eventModel) async {
    Reference refRoot = FirebaseStorage.instance.ref();
    Reference refEvents = refRoot..child('events');
    Reference refImage =
        refEvents.child('${eventModel.image}_${{eventModel.date}}');

    await refImage.putFile(
      File(eventModel.image),
    );
    await refImage.getDownloadURL().then((value) async {
      String dateString = '${eventModel.date} ${eventModel.time}';
      DateFormat dateFormat = DateFormat('MMM d, yyyy h:mm a');
      DateTime dateTime = dateFormat.parse(dateString);
      await FirebaseFirestore.instance.collection('events').doc().set({
        'name': eventModel.name,
        'date': eventModel.date,
        'image': value,
        'time': eventModel.time,
        'location': eventModel.location,
        'timestamp': dateTime.millisecondsSinceEpoch
      });
    });
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          'event added successfully',
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
  }

  @override
  Future deleteEvent(String eventId) async {
    await FirebaseFirestore.instance.collection('events').doc(eventId).delete();
  }

  @override
  Future uploadAdminData(BuildContext context, AdminModel adminModel) async {
    Reference refRoot = FirebaseStorage.instance.ref();
    Reference refAdmins = refRoot.child('admins');
    Reference refImage = refAdmins.child(adminModel.email);

    await refImage.putFile(
      File(adminModel.image),
    );
    await refImage.getDownloadURL().then(
      (value) async {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: adminModel.email, password: adminModel.password)
            .then((user) {
          user.user!.updateProfile(
            displayName: adminModel.name,
            photoURL: value,
          );
        });
        await FirebaseFirestore.instance
            .collection('admins')
            .doc(adminModel.email)
            .set({
          'name': adminModel.name,
          'email': adminModel.email,
          'image': value,
          'password': adminModel.password
        });
      },
    );
    if (context.mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          'event added successfully',
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
  }
}
