import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mini_projects/pages/expansion_tile/expansion_tile_controller.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';

class ExpansionTilePage extends StatelessWidget {
  const ExpansionTilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Tile'),
      ),
      body: const Column(
        children: [
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: c.bikes.length,
          //     itemBuilder: (context, index) {
          //       return card('Bike ${index+1}', c.bikes[index]);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget card(String title, String subtitle) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        child: ExpandablePanel(
          header: customText(title),
          collapsed: const SizedBox(),
          expanded: customText(subtitle),
        ),
      ),
    );
  }
}
