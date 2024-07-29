import 'package:bijak/core/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';

void main() async {
  await setup();
  runApp(
    GetMaterialApp(
      title: "Bijak",
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
