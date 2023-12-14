import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/home/home_controller.dart';
import 'package:flutter_mini_projects/properties/style.dart';
import 'package:flutter_mini_projects/routes/route_name.dart';
import 'package:get/get.dart';

import '../../properties/color.dart';
import '../../properties/size.dart';
import '../../widgets/custom_list_tile.dart';
import '../../widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: GetBuilder<HomeController>(builder: (c) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(padding),
                child:
                    customText(c.getGreeting('Kevin'), fontSize: FontSize.s18),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: customText('Mobile App Project', color: Colors.blue),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: padding / 2,
                ),
                child: customText('Flutter Fundamental',
                    color: Colors.black.withOpacity(0.7),
                    fontSize: FontSize.s22,
                    fontWeight: semiBold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                ),
                child: customText(
                  c.getDateTime(),
                  color: Colors.grey,
                  fontSize: FontSize.s14,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: padding / 2,
              ),
              Expanded(
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  children: [
                    customListTile(
                        title: 'Form Validation',
                        subtitle: 'This is example to create form validation.',
                        ontap: () {
                          log('Validation Form has Triggered');
                          Get.toNamed(RouteName.formValidation);
                        },
                        tileColor: pinkColor),
                    customListTile(
                      title: 'Handle No Connection',
                      subtitle:
                          'This method is used to handle applicaton when there is no connection internet.',
                      ontap: () {
                        log('Handle no connection has triggered');
                        Get.toNamed(RouteName.noConnection);
                      },
                      tileColor: blueColor,
                    ),
                    customListTile(
                      title: 'Handle Permission',
                      subtitle:
                          'This method is used to handle permission to access location, contacts, etc.',
                      ontap: () {
                        log('Handle permission has triggered');
                        Get.toNamed(RouteName.handlePermission);
                      },
                      tileColor: orangeColor,
                    ),
                    customListTile(
                      title: 'Scrollable List',
                      subtitle: 'This method is used to going spesific index.',
                      ontap: () {
                        log('Handle Scrollable has triggered');
                        Get.toNamed(RouteName.scrollable);
                      },
                      tileColor: pinkColor,
                    ),
                    customListTile(
                      title: 'Slivers',
                      subtitle: 'This widget to use like a instagram profile.',
                      ontap: () {
                        log('Widget Slivers has triggered');
                        Get.toNamed(RouteName.scrollable);
                      },
                      tileColor: blueColor,
                    ),
                    customListTile(
                      title: 'Countdown Timer',
                      subtitle: 'This widget to use like a OTP Request.',
                      ontap: () {
                        log('Widget Countdown Timer has triggered');
                        Get.toNamed(RouteName.countdown);
                      },
                      tileColor: orangeColor,
                    ),
                    customListTile(
                      title: 'Expansion Tile',
                      subtitle:
                          'Expansion tile is using to dropdown information.',
                      ontap: () {
                        log('Expansion Tile has triggered');
                        Get.toNamed(RouteName.expansion);
                      },
                      tileColor: pinkColor,
                    ),
                    customListTile(
                      title: 'Agora Video Call',
                      subtitle:
                          'Real-time video engagement immerses people in the sounds of human connections.',
                      ontap: () {
                        Get.toNamed(RouteName.agoraVideoCall);
                      },
                      tileColor: blueColor,
                    ),
                    customListTile(
                      title: 'Timeline Tile',
                      subtitle:
                          'A linear representation of important events in the order in which they occurred.',
                      ontap: () {
                        Get.toNamed(RouteName.timeline);
                      },
                      tileColor: orangeColor,
                    ),
                    customListTile(
                      title: 'Cloud Firestore',
                      subtitle:
                          'A NoSQL document database that lets you easily store, sync, and query data for your mobile and web apps.',
                      ontap: () {
                        Get.toNamed(RouteName.cloudFirestore);
                      },
                      tileColor: pinkColor,
                    ),
                    customListTile(
                      title: 'Text Recognized',
                      subtitle:
                          'Solve common problems in your apps with machine learning',
                      ontap: () {
                        Get.toNamed(RouteName.textRecognize);
                      },
                      tileColor: blueColor,
                    ),
                    customListTile(
                      title: 'Routing Page',
                      subtitle:
                          'Routing Page between page within passing data',
                      ontap: () {
                        Get.toNamed(RouteName.routingPage);
                      },
                      tileColor: orangeColor,
                    ),
                    customListTile(
                      title: 'Cart Logic Page',
                      subtitle:
                          'Create a shopping cart like a e-commerce app',
                      ontap: () {
                        Get.toNamed(RouteName.cartPage);
                      },
                      tileColor: pinkColor,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
