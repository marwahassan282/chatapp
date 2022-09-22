import 'package:appchat/base.dart';
import 'package:appchat/database/database-utils.dart';
import 'package:appchat/models/my-user.dart';
import 'package:appchat/modules/layouyt/Register/Navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel extends BaseViewModel <RegisterNavigator>{
String ? message;
FirebaseAuth firebaseAuth=FirebaseAuth.instance;
   CreateAccount(String email,String password,String fName,String lName,String userName) async{


  try {
  navigator.showloading('loading....',false);
    final credential =   await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    //navigator.hideloading();
    MyUser user=MyUser(id: firebaseAuth.currentUser?.uid??'', fName: fName, lName: lName, userName: userName, email: email);
  var result =DatabaseUtils.CreateDbUser(user);
  navigator.gotohome(user);
  navigator.hideloading();



  }
  on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      message='The password provided is too weak.';


    } else if (e.code == 'email-already-in-use') {
      message='The account already exists for that email.';


    }
    navigator.hideloading();
    if(message!=null){
      navigator.showmessage(message!);
    }
  } catch (e) {
    print(e);
  }

}



}