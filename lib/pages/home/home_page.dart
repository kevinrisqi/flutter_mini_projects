import 'dart:developer';

import 'package:flutter/material.dart';

import '../../properties/color.dart';
import '../../properties/size.dart';
import '../../widgets/custom_list_tile.dart';
import '../../widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: foregroundColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          customText(title: 'Welcome,\nKevin', fontSize: FontSize.s18),
          SizedBox(
            height: padding * 2,
          ),
          customListTile(
            title: 'Form Validation',
            subtitle: 'This is example to create form validation',
            ontap: () {
              log('Validation Form has Triggered');
            },
          ),
          customListTile(),
        ],
      ),
    );
  }
}
