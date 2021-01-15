import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum kullaniciDurumlari {
  oturumAcmis,
  oturumAciyor,
  oturumAcmamis,
}

class FirebaseServis extends ChangeNotifier {
   FirebaseAuth _auth = FirebaseAuth.instance;
  kullaniciDurumlari _durumlari = kullaniciDurumlari.oturumAcmamis;

  kullaniciDurumlari get durumlari => _durumlari;

  set durumlari(kullaniciDurumlari value) {
    _durumlari = value;
    notifyListeners();
  }

  FirebaseServis() {
    _auth.authStateChanges().listen(authListenChangeDinleme);
  }

  void authListenChangeDinleme(User user) {
    if (user == null) {
      durumlari = kullaniciDurumlari.oturumAcmamis;

      ///burada durumlari'na veri göndermemizin sebebi yukarıdaki set ismi olduğu için. _durumlari'na veri gönderseydik değişkene göndermiş olurduk bu da hatalı olurdu
    } else {
      durumlari = kullaniciDurumlari.oturumAcmis;
    }
  }

  Future<User> uyeOlmaMetodu(String mail, String sifre) async {
    try {
      durumlari = kullaniciDurumlari.oturumAciyor;
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: mail, password: sifre);
      User _yeniKullanici = _credential.user;
      return _yeniKullanici;
    } catch (e) {
      durumlari = kullaniciDurumlari.oturumAcmamis;
      print("create user' da hata çıktııııı" + e.toString());
      return null;
    }
  }
  Future<User> girisYapmaMetodu(String mail, String sifre) async {
    try {
      durumlari = kullaniciDurumlari.oturumAciyor;
      UserCredential _credential = await _auth.signInWithEmailAndPassword(
          email: mail, password: sifre);
      User _oturumAcanKulanici = _credential.user;
      return _oturumAcanKulanici;
    } catch (e) {
      durumlari = kullaniciDurumlari.oturumAcmamis;
      print("signIn de hata çıktııııı" + e.toString());
      return null;
    }
  }
  Future<bool> cikisYapmaMetodu() async {
   try{
     await _auth.signOut();
     return true;
   }catch(e){
     print("sing Out' da hata çıktı");
     return false;
   }
  }
}
