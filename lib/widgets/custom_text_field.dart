import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/global/controller/global_controller.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../properties/color.dart';
import '../properties/size.dart';

class customTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;
  int? maxLength;
  AutovalidateMode? autovalidateMode;
  String? Function(String?)? validator;
  Function(String)? onFieldSubmitted;
  double? height;
  int? maxLines;

  customTextField({
    this.controller,
    this.hintText,
    this.maxLength,
    this.autovalidateMode,
    this.validator,
    this.onFieldSubmitted,
    this.height,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height ?? 35,
          child: TextFormField(
            maxLines: maxLines ?? 1,
            controller: controller,
            maxLength: maxLength,
            autovalidateMode: autovalidateMode,
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
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
        ),
      ],
    );
  }
}
