import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/form_validation/form_validation_controller.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:get/get.dart';

import '../../widgets/custom_text_field.dart';

class FormValidationPage extends StatelessWidget {
  const FormValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormValidationController>(
      builder: (c) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: foregroundColor,
            title: const Text('Form Validation'),
            actions: [
              InkWell(
                onTap: () {
                  log('Reset All Changes');
                  c.clear();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: const Icon(Icons.delete),
                ),
              )
            ],
          ),
          body: GetBuilder<FormValidationController>(
            builder: (c) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: padding),
                children: [
                  SizedBox(
                    height: padding * 2,
                  ),
                  customTextField(
                    controller: c.firstNameController,
                    hintText: 'Input your first name',
                    error: 'First name must be filled',
                    autovalidateMode: AutovalidateMode.always,
                  ),
                ],
              );
            },

          ),
          bottomNavigationBar: ElevatedButton(onPressed: (){}, child: Text('')),
        );
      },
    );
  }
}
