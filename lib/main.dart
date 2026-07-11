import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return HomeScreen();
  }
}
