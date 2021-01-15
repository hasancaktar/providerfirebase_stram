import 'package:flutter/material.dart';

class EkranBir extends StatefulWidget {
  EkranBir({Key key}) : super(key: key);

  @override
  _EkranBirState createState() => _EkranBirState();
}

class _EkranBirState extends State<EkranBir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("asd"),
      ),
      body: Center(
        child: Text("bBURASI EKRAN"),
      ),
    );
  }
}
