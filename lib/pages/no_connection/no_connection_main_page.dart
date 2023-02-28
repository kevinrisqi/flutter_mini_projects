import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/no_connection/no_connection_controller.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';

class NoConnectionMainPage extends StatelessWidget {
  const NoConnectionMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Connection Page'),
      ),
      body: GetBuilder<NoConnectionController>(
        builder: (c) {
          var data = c.dataUsers?['data'];
          if (data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          log('${c.dataUsers?['data'].length}');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: padding * 3),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customText(
                  'Data Users',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: padding,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                // itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: customText('${data[index]['first_name']}'),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
