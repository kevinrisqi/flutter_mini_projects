import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mini_projects/pages/scrollable_list/scrollable_list_controller.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollableListPage extends StatelessWidget {
  const ScrollableListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Scrollable List',
          ),
        ),
        body: GetBuilder<ScrollableListController>(builder: (c) {
          return Column(
            children: [
              SizedBox(
                height: padding * 2,
              ),
              ListTile(
                leading: customText('Index',
                    fontWeight: FontWeight.w600, fontSize: Sizes.s15),
                title: customText(
                  'Users',
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.s15,
                ),
              ),
              Expanded(
                child: ScrollablePositionedList.builder(
                  itemScrollController: c.itemScrollController,
                  itemPositionsListener: c.itemPositionsListener,
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    var count = index + 1;
                    return ListTile(
                      title: Text(
                        'Bot #00$count',
                      ),
                      leading: Text('$index'),
                    );
                  },
                ),
              ),
            ],
          );
        }),
        floatingActionButton:
            GetBuilder<ScrollableListController>(builder: (c) {
          return FloatingActionButton(
            onPressed: () {
              c.scrollJumpTo(20);
              log('Position: ${c.itemPositionsListener.itemPositions}');
            },
            child: const Icon(Icons.arrow_downward),
          );
        }),
      ),
    );
  }
}
