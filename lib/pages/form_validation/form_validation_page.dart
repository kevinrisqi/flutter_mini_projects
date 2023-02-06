import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_mini_projects/properties/size.dart';

class FormValidationPage extends StatelessWidget {
  const FormValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.s50,
      height: Sizes.s50,
      color: primaryColor,
    );
  }
}
