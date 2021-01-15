import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebase/firebase/firebaseServis.dart';
import 'package:providerfirebase/sayac/ekran_bir.dart';
import 'package:providerfirebase/sayac/ekran_iki.dart';
import 'package:providerfirebase/sayac/providers.dart';

class SayacUyg extends StatefulWidget {
  @override
  _SayacUygState createState() => _SayacUygState();
}

class _SayacUygState extends State<SayacUyg> {
  @override
  Widget build(BuildContext context) {
    print("burası SayacUyg stateful");
    final myAuth = Provider.of<FirebaseServis>(context);
    switch (myAuth.durumlari) {
      case kullaniciDurumlari.oturumAciyor:
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );

      case kullaniciDurumlari.oturumAcmis:
        return Scaffold(
          floatingActionButton: MyFloatings(),
          appBar: AppBar(
            title: Text("Sayac Uygulaması"),
          ),
          body: MyBody(),
        );
      case kullaniciDurumlari.oturumAcmamis:
        return Scaffold(
          appBar: AppBar(
            title: Text("Oturum Aç"),
          ),
          body: Center(
            child: Column(
              children: [
                Text("Lütfen oturum açın"),
                RaisedButton(
                    child: Text("Kullanıcı oluştur."),
                    onPressed: () async {
                      await myAuth.uyeOlmaMetodu("hasan@hasan.com", "123123");
                    }),
                RaisedButton(
                    child: Text("Oturum Aç."),
                    onPressed: () async {
                      await myAuth.girisYapmaMetodu(
                          "hasan@hasan.com", "123123");
                    }),
              ],
            ),
          ),
        );
    }
  }
}

class MyBody extends StatelessWidget {
  const MyBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mySayac = Provider.of<FirebaseServis>(context);
    print("burası body stateless");

    return Center(
      child: Column(
        children: [
          Text(context.watch<Counter>().sayac.toString()),
          RaisedButton(
              child: Text("bir"),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => EkranBir()))),
          RaisedButton(
              child: Text("iki"),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider<Counter>(
                          create: (context) => Counter(), child: EkranIke())))),
          RaisedButton(
              child: Text("Çıkış"),
              onPressed: () async {
                await mySayac.cikisYapmaMetodu();
              }),
        ],
      ),
    );
  }
}

class MyFloatings extends StatelessWidget {
  const MyFloatings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mySayac = Provider.of<Counter>(context, listen: false);
    print("burası floating stateless");
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            heroTag: "1",
            child: Icon(Icons.plus_one),
            onPressed: () {
              context.read<Counter>().arttir();
            }),
        FloatingActionButton(
            heroTag: "2",
            child: Icon(Icons.exposure_minus_1),
            onPressed: () {
              context.read<Counter>().azalt();
            }),
      ],
    );
  }
}
