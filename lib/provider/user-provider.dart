import 'package:appchat/database/database-utils.dart';
import 'package:appchat/models/my-user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
 MyUser?  myUser;
User ? Firebaseuser;

UserProvider(){
  Firebaseuser=FirebaseAuth.instance.currentUser;
  initmyuser();

}
 initmyuser()async{
  if(Firebaseuser!=null)
  myUser= await DatabaseUtils.readuser(Firebaseuser?.uid??'');
}

}