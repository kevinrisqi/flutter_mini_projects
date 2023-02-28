import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_mini_projects/properties/constant.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/routes/route_name.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            customText(
              'Please check your connection',
              fontSize: Sizes.s18,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: padding * 2,
            ),
            Lottie.asset(
              noConnectionLottie,
              width: 300,
              repeat: false,
            ),
            SizedBox(
              height: padding * 3,
            ),
            ElevatedButton(
              onPressed: () async {
                String previousRoute = Get.previousRoute;
                log('Previous Route: $previousRoute');
                Get.back();
                // Get.toNamed(RouteName.noConnection);
                Get.toNamed(previousRoute);
              },
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: padding * 2, vertical: padding / 1.2),
                child: customText(
                  'Refresh',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
