import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;

import 'profile.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'onboarding.dart';
import 'selling.dart';
import 'homescreeno.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'screen1.dart';
import 'splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926), // Design size based on the iPhone 13 Pro Max dimensions
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'ShopNest',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData.dark(),
          home: SplashScreen(),
        );
      },
    );
  }
}
