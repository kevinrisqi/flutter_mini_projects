import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/global/controller/global_controller.dart';
import 'package:flutter_mini_projects/pages/form_validation/form_validation_controller.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/properties/style.dart';
import 'package:flutter_mini_projects/widgets/custom_appbar.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../widgets/custom_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormValidationPage extends StatelessWidget {
  const FormValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar(
        'Form Validation',
        hasClear: true,
        actionTap: () {
          log('Action to clear form');
        },
      ),
      body: GetBuilder<GlobalController>(
        builder: (c) {
          final cFormValid = Get.put(FormValidationController());
          return Form(
            key: c.formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: padding),
              children: [
                SizedBox(
                  height: padding * 2,
                ),
                customTextField(
                  controller: c.firstNameController,
                  hintText: 'Input your first name',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    log('Value: $value');
                    if (value == null || value == '') {
                      return 'First name must be filled';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: padding,
                ),
                ListTile(
                  leading: customText('Peserta', fontWeight: medium),
                  trailing: InkWell(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const AddParticipant();
                        },
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        customText(
                          'Tambah Peserta',
                          color: Colors.blue,
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                TextField(
                controller: cFormValid.resultTextController,
                maxLines: 20,
                decoration: const InputDecoration.collapsed(
                  hintText: 'result',
                ),
              )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: GetBuilder<FormValidationController>(builder: (c) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(padding - 8),
            child: Obx(
              () => Visibility(
                visible: !c.isLoading.value,
                replacement: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.discreteCircle(
                      color: primaryColor,
                      size: 30,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    c.handleSubmit();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: padding),
                  ),
                  child: customText(
                    'Submit',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.s16,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class AddParticipant extends StatelessWidget {
  const AddParticipant({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormValidationController>(builder: (c) {
      return Container(
        padding: EdgeInsets.only(
          left: padding,
          right: padding,
          top: padding,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          // border: Border(left: BorderSide(), bottom: BorderSide(), right: BorderSide())
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              customText(
                'Tambah Peserta',
                fontWeight: semiBold,
                fontSize: FontSize.s16,
              ),
              SizedBox(
                height: padding * 2,
              ),
              Container(
                  width: double.infinity,
                  height: 40,
                  padding: EdgeInsets.all(padding / 2.5),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 180, 207, 255),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: customText('Peserta'),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: customText('Email'),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            c.addParticipant();
                          },
                          icon: Icon(
                            FontAwesomeIcons.solidPlusSquare,
                            size: 15,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: padding / 2.5,
                ),
                // height: 20,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: c.emailTextControllerList.length,
                  itemBuilder: (context, index) {
                    return participantTile(index);
                  },
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {
                    c.saveParticipant();
                  },
                  child: customText(
                    'Simpan',
                    fontSize: FontSize.s16,
                    fontWeight: semiBold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget participantTile(int index) {
    return GetBuilder<FormValidationController>(builder: (c) {
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: customTextField(
                hintText: 'Nama',
                controller: c.nameTextControllerList[index],
              ),
            ),
          ),
          SizedBox(
            width: padding,
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: customTextField(
                hintText: 'Email',
                controller: c.emailTextControllerList[index],
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                c.removeParticipant(index);
              },
              icon: Icon(
                FontAwesomeIcons.trash,
                size: 15,
                color: Colors.red[300],
              ),
            ),
          ),
        ],
      );
    });
  }
}
