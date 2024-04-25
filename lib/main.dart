import 'package:flutter/material.dart';
import 'package:uribe0418/screen/singup.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // A widget which will be started on application startup
      home: SingUp(),
    );
  }
}
