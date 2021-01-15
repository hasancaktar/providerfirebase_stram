
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers.dart';

class EkranIke extends StatefulWidget {
  EkranIke({Key key}) : super(key: key);

  @override
  _EkranIkeState createState() => _EkranIkeState();
}

class _EkranIkeState extends State<EkranIke> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ekran 2"),
      ),
      body: ChangeNotifierProvider<Counter>(create: (context)=>Counter(),child: SayfaIkiyegelenVerininGorunumu()),
    );
  }
}

class SayfaIkiyegelenVerininGorunumu extends StatelessWidget {
  const SayfaIkiyegelenVerininGorunumu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("bBURASI EKRAN 2222"),
          Text(context.watch<Counter>().sayac.toString()),
        ],
      ),
    );
  }
}
