import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebase/firebase/firebaseServis.dart';
import 'package:providerfirebase/sayac/providers.dart';
import 'package:providerfirebase/sayac/sayacUyg.dart';
import 'package:providerfirebase/streamileSayac/streamilesayac.dart';

class Sayac extends StatefulWidget {
  @override
  _SayacState createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sdf"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MultiProvider(providers: [
                      ChangeNotifierProvider(create: (context) => Counter()),
                      ChangeNotifierProvider(create: (context) => FirebaseServis()),
                    ],
                    child: SayacUyg(),),
                  ),
                );
              },
              child: Text("Sayac uyglulamasını Başlat"),
            ),
            RaisedButton(
              onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (_)=>StreamSayacUyg()));
              },
              child: Text("Stream İle sayac"),
            )
          ],
        ),
      ),
    );
  }
}
