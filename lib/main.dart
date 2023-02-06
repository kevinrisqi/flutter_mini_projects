import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/routes/route.dart';
import 'package:flutter_mini_projects/routes/route_name.dart';
import 'package:flutter_mini_projects/widgets/custom_list_tile.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.home,
      getPages: pages,
      
    );
  }
}

