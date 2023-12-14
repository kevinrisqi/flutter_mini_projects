import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/cloud_firestore/cloud_firestore_controller.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CloudFirestorePage extends GetView<CloudFirestoreController> {
  const CloudFirestorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Firestore'),
      ),
      body: GetBuilder<CloudFirestoreController>(builder: (c) {
        log('message');
        return StreamBuilder<QuerySnapshot>(
          stream: c.users,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: customText('Data masih kosong!'),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  dynamic data = snapshot.data!.docs[index].data();
                  return ListTile(
                    title: customText(
                        '${data['first']} ${(data['middle']) ?? ''} ${data['last']}'),
                  );
                });
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.testUpload();
        },
        child: const Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
