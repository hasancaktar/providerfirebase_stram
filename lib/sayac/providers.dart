import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {

   int _sayac=0;

  int get sayac => _sayac;

  void arttir(){
    _sayac++;
    notifyListeners();
  }
  void azalt(){
    _sayac--;
    notifyListeners();
  }
}
