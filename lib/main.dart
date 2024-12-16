import 'package:flutter/material.dart';
import 'views/user_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserView(),
    );
  }
}
