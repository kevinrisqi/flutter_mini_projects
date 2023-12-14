import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/text_recognize/text_recognize_controller.dart';
import 'package:flutter_mini_projects/pages/text_recognize/text_recognize_detail_page.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextRecognizePage extends StatelessWidget {
  const TextRecognizePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Recognize'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Text Recognize by Firebase'),
            SizedBox(
              height: padding,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: TextRecognizeController.to.listDoc.length,
              itemBuilder: (context, index) {
                var data = TextRecognizeController.to.listDoc[index];
                return InkWell(
                  onTap: () {
                    Get.to(const TextRecognizeDetailPage());
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: padding / 4),
                    decoration: BoxDecoration(color: blueColor),
                    child: ListTile(
                      title: Text(data),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
