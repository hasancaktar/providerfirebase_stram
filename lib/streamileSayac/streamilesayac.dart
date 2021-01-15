import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebase/firebase/firebaseServis.dart';
import 'package:providerfirebase/sayac/ekran_bir.dart';
import 'package:providerfirebase/sayac/ekran_iki.dart';
import 'package:providerfirebase/sayac/providers.dart';

class StreamSayacUyg extends StatefulWidget {
  @override
  _StreamSayacUygState createState() => _StreamSayacUygState();
}

class _StreamSayacUygState extends State<StreamSayacUyg> {
  int _counter = 0;

  final StreamController<int> _streamController = new StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Sayac"),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: "1",
              child: Icon(Icons.plus_one),
              onPressed: () {
                _streamController.sink.add(++_counter);
              }),
          FloatingActionButton(
              heroTag: "2",
              child: Icon(Icons.exposure_minus_1),
              onPressed: () {
                _streamController.sink.add(--_counter);
              }),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          initialData: 0,
          stream: _streamController.stream,
          builder: (context, AsyncSnapshot<int> snapshot) {
            return Text(snapshot.data.toString());
          },
        ),
      ),
    );
  }
}
