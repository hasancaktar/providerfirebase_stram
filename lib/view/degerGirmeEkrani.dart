import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebase/provider.dart';

class GirdiEkrani extends StatefulWidget {
  @override
  _GirdiEkraniState createState() => _GirdiEkraniState();
}

class _GirdiEkraniState extends State<GirdiEkrani> {
  final isimController = TextEditingController();
  final yasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Girdi Ekranı"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("İSİM"),
            TextField(onChanged: (val){
              context.read<VeriGecisi>().isim=val;
            },
              controller: isimController,
            ),
            Text("YAŞ"),
            TextField(onChanged: (val){
              context.read<VeriGecisi>().yas=val as int;
            },
              controller: yasController,
            ),
          ],
        ),
      ),
    );
  }
}
