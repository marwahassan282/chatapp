import 'package:appchat/modules/add-Room/addroom.dart';
import 'package:appchat/modules/layouyt/chat/chatscreen.dart';
import 'package:appchat/modules/layouyt/home/homescreen.dart';
import 'package:appchat/modules/layouyt/login/loginscreen.dart';
import 'package:appchat/provider/user-provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/layouyt/Register/Register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await  Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvider>(create: (c)=>UserProvider()),
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<UserProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:   provider.Firebaseuser==null?LoginScreen.routeName:HomeScreen.routeName ,
        routes: {
          RegisterScreen.routeName: (c) => RegisterScreen(),
        LoginScreen.routeName: (c) =>LoginScreen(),
          HomeScreen.routeName:(c)=>HomeScreen(),
          AddRoomScreen.routName:(c)=>AddRoomScreen(),
          ChatScreen.routeName:(c)=>ChatScreen(),

        }
    );
  }
}
