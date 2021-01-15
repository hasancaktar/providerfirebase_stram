import 'package:flutter/cupertino.dart';

class VeriGecisi extends ChangeNotifier{
String _isim;
int _yas;

String get isim => _isim;

  set isim(String value) {
    _isim = value;
    notifyListeners();
  }

int get yas => _yas;

  set yas(int value) {
    _yas = value;
    notifyListeners();
  }
  isimleIlgiliIslemler(String yeniIsim){
    _isim=yeniIsim;
    notifyListeners();
  }
  yasIleIlgiliIslemler(int val){
    _yas=val;
    notifyListeners();
  }
}