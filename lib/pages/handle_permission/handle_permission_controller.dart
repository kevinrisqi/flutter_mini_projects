import 'dart:developer';
import 'dart:io';

import 'package:contacts_service/contacts_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/routes/route_name.dart';

import 'package:flutter_mini_projects/services/data_store_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widgets/custom_snackbar.dart';

class HandlePermissionController extends GetxController {
  bool? hasPermissionContact;
  bool? hasPermissionPhotos;

  File? file;

  List<Contact>? contacts;

  Future<void> changePermissionContact() async {
    hasPermissionContact = !hasPermissionContact!;
    await DataStoreService.setPermissionContact(value: hasPermissionContact!);
    update();
  }

  Future<bool> getPermissionContact() async {
    // var contactStatus = await Permission.contacts.status;
    // log('Contact Permission: $contactStatus');
    if (await Permission.contacts.isDenied) {
      log('Permission contact is denied');
      await openAppSettings();
    }
    if (await Permission.contacts.isPermanentlyDenied) {
      log('Permission contact is permanently denied');
      await openAppSettings();
    }

    bool contact = await Permission.contacts.request().isGranted;
    if (contact) {
      DataStoreService.setPermissionContact(value: contact);
    }
    return contact;
  }

  Future<void> getContact() async {
    var hasPermissionContact = await getPermissionContact();
    if (!hasPermissionContact) {
      return customSnackBar('Permission contact is denied', isSuccess: false);
    }
    // Get all contacts without thumbnail (faster)
    contacts = await ContactsService.getContacts(withThumbnails: false);

    log('Data Contact: ${contacts?[0].displayName}');
    Get.toNamed(RouteName.contact);
    update();
  }

  Future<void> loadData() async {
    log('Has Permission Contact: ${await DataStoreService.getPermissionContact}');
    hasPermissionContact = await DataStoreService.getPermissionContact;
    update();
  }

  Future<void> refreshContact() async {
    contacts =
        await ContactsService.getContacts(withThumbnails: false, query: 'Anna');
    update();
  }

  @override
  void onInit() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      loadData();
    });
    log('Handle Permission Init');

    super.onInit();
  }
}
