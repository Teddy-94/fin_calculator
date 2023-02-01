import 'package:flutter/material.dart';
import 'components/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Financial Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      //themeMode: ThemeMode.system,
      home: const MainPage(
          title: 'Compound Annual Growth Rate (CAGR) Calculator'),
    );
  }
}
