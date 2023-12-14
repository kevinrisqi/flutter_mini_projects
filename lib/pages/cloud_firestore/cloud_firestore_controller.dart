import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mini_projects/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class CloudFirestoreController extends GetxController {
  var db;
  late Stream<QuerySnapshot> users;

  void fetchData() async {
    try {
      users = FirebaseFirestore.instance.collection('users').snapshots();
      log('Users: $users');
      // update();
    } catch (e) {
      customSnackBar(e.toString(), isSuccess: false);
    }
  }

  Future<void> refreshData() async {
    fetchData();
  }

  void testUpload() async {
    try {
      /// Create a new user with a first and last name
      final user = <String, dynamic>{
        "first": "Kevin",
        "middle": "akan selalu memberi support",
        "last": "Lidya",
        "born": 1999
      };

      /// Add a new document with a generated ID
      db.collection("users").add(user).then((DocumentReference doc) =>
          log('DocumentSnapshot added with ID: ${doc.id}'));
    } catch (e) {
      customSnackBar(e.toString(), isSuccess: false);
    }
  }

  @override
  void onInit() {
    log('Firestore Controller INIT');
    db = FirebaseFirestore.instance;
    fetchData();
    super.onInit();
  }
}
