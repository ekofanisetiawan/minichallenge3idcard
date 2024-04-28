import 'package:flutter/material.dart';
import 'package:mini_challenge3_idcard/id_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ID Card',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: IDCard(), // ID Card widget
    );
  }
}
