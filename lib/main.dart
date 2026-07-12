import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/home_screen.dart';
import 'package:provider/provider.dart';

import 'viewmodels/user_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}