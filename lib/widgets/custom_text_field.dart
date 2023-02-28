import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/global/controller/global_controller.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../properties/color.dart';
import '../properties/size.dart';

class customTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;
  String? error;
  int? maxLength;
  AutovalidateMode? autovalidateMode;

  customTextField({
    this.controller,
    this.hintText,
    this.error,
    this.maxLength,
    this.autovalidateMode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          maxLength: maxLength,
          autovalidateMode: autovalidateMode,
          validator: (value) {
            if (value == null) {
              return '$error';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: padding / 2,
              horizontal: padding / 2,
            ),
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: foregroundColor,
                width: 10,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        if (error != null) ...[
          Padding(
            padding: EdgeInsets.only(
                left: padding - 6, top: (maxLength == null) ? padding / 2 : 0),
            child: customText(error!, color: Colors.red),
          )
        ]
      ],
    );
  }
}
