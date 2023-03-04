import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/properties/constant.dart';
import 'package:flutter_mini_projects/routes/bindings.dart';
import 'package:flutter_mini_projects/routes/route.dart';
import 'package:flutter_mini_projects/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(hivePref);
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
      initialBinding: HomeBinding(),
    );
  }
}
