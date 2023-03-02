import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/global/controller/global_controller.dart';
import 'package:flutter_mini_projects/pages/form_validation/form_validation_controller.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/widgets/custom_appbar.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../widgets/custom_text_field.dart';

class FormValidationPage extends StatelessWidget {
  const FormValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar(
        'Form Validation',
        hasClear: true,
        actionTap: () {
          log('Action to clear form');
        },
      ),
      body: GetBuilder<GlobalController>(
        builder: (c) {
          return Form(
            key: c.formKey,
            child: ListView(
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
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(padding - 8),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: padding),
          ),
          child: customText(
            'Submit',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: Sizes.s16,
          ),
        ),
      ),
    );
  }
}
