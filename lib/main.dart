import 'package:flutter/material.dart';
import 'package:newsightsai/Authentication/auth_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Define the theme notifier as a static variable
  //static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    //return ValueListenableBuilder<ThemeMode>(
    //valueListenable: themeNotifier,
    //builder: (_, ThemeMode currentMode, __) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      //themeMode: currentMode,
      home: AuthPage(),
    );
    // },
    //);
  }
}