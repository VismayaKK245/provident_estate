
import 'package:flutter/material.dart';
import 'package:project1/home_pages/desktop_scaffold.dart';
import 'package:project1/home_pages/mobile_scaffold.dart';
import 'package:project1/home_pages/tablet_scaffold.dart';
import 'package:project1/responsive_layout/responsive_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}