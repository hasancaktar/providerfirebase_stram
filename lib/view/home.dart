import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebase/provider.dart';
import 'package:providerfirebase/view/degerGirmeEkrani.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: top_level_instance_method
  @override
  Widget build(BuildContext context) {
    var myIsim = Provider.of<VeriGecisi>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Anasayfa"),
            ),
            body: Center(
              child: Column(
                children: [
                  Card(
                    child: Text(myIsim.isim?? "null"),
                  ),
                  Card(
                    child: Text(myIsim.isim?? "null"),
                  ),
                  Card(
                    child: Text(myIsim.yas.toString()?? "null"),
                  ),
                  RaisedButton(
                      child: Text("Veri Almaya Git"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChangeNotifierProvider(create: (context){
                              VeriGecisi();
                            },
                                child: GirdiEkrani()),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
