import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/handle_permission/handle_permission_controller.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/widgets/custom_appbar.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Contact List'),
      body: GetBuilder<HandlePermissionController>(
        builder: (c) {
          if (c.contacts == null) const CircularProgressIndicator();
          if (c.contacts!.isEmpty) {
            Center(
              child: Column(
                children: [
                  customText('Data kosong'),
                ],
              ),
            );
          }
          return Column(
            children: [
              SizedBox(
                height: padding,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: c.refreshContact,
                  child: ListView.builder(
                    itemCount: c.contacts!.length,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Contact contact = c.contacts?[index] ?? Contact();
                      return ListTile(
                        leading: const Icon(
                          Icons.person,
                          size: 50,
                        ),
                        title: customText(contact.displayName ?? '-',
                            fontWeight: FontWeight.w600),
                        subtitle:
                            customText(contact.phones?.first.value ?? '-'),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
