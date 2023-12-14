import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/routing_page/routing_page_controller.dart';
import 'package:flutter_mini_projects/pages/routing_page/second_page.dart';
import 'package:flutter_mini_projects/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class RoutingPage extends StatelessWidget {
  const RoutingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Routing Page'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                final c = Get.put(RoutingPageController());
                Get.to(SecondPage(datas: c.listData));
              },
              child: const Text('Next Page'),
            ),
          )
        ],
      ),
    );
  }
}
