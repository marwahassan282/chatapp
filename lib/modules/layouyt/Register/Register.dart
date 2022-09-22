
import 'package:appchat/base.dart';
import 'package:appchat/models/my-user.dart';
import 'package:appchat/modules/layouyt/Register/Navigator.dart';
import 'package:appchat/modules/layouyt/home/homescreen.dart';
import 'package:appchat/modules/layouyt/login/loginscreen.dart';
import 'package:appchat/provider/user-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'RegisterViewModel.dart';
class RegisterScreen extends StatefulWidget {
  static const String routeName='register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState <RegisterScreen, RegisterViewModel> implements RegisterNavigator {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  var FirstNameController = TextEditingController();

  var LastNameController = TextEditingController();

  var UserNameController = TextEditingController();

  var EmailNameController = TextEditingController();

  var passwordNameController = TextEditingController();

  RegisterViewModel registerViewModel = RegisterViewModel();

  @override
  void initState() {
    super.initState();
    registerViewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => registerViewModel,
      child: Stack(
          children: [
            Container(
              child: Image.asset(
                'assets/images/homebackground.png', width: double.infinity,
                fit: BoxFit.fill,),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text('create Account'),

              ),
              body: Form(
                key: globalKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: FirstNameController,

                            keyboardType: TextInputType.text,
                            obscureText: false,
                            decoration: InputDecoration(
                                hintText: 'Enter First Name',


                                enabledBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(context),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey
                                  ),

                                ),
                                filled: true,
                                contentPadding: EdgeInsets.all(8)
                            ),
                            validator: (text) {
                              if (text == null || text
                                  .trim()
                                  .isEmpty) {
                                return 'please enter First Name';
                              }
                              return null;
                            },


                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: LastNameController,

                            keyboardType: TextInputType.text,
                            obscureText: false,
                            decoration: InputDecoration(
                                hintText: 'Enter Last Name',


                                enabledBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(context),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey
                                  ),

                                ),
                                filled: true,
                                contentPadding: EdgeInsets.all(8)
                            ),
                            validator: (text) {
                              if (text == null || text
                                  .trim()
                                  .isEmpty) {
                                return 'please enter Last Name';
                              }
                              return null;
                            },


                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: UserNameController,

                            keyboardType: TextInputType.text,
                            obscureText: false,
                            decoration: InputDecoration(
                                hintText: 'Enter User  Name',


                                enabledBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(context),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey
                                  ),

                                ),
                                filled: true,
                                contentPadding: EdgeInsets.all(8)
                            ),
                            validator: (text) {
                              if (text == null || text
                                  .trim()
                                  .isEmpty) {
                                return 'please enter User Name';
                              }
                              return null;
                            },


                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: EmailNameController,

                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            decoration: InputDecoration(
                                hintText: 'Enter Email address',


                                enabledBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(context),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey
                                  ),

                                ),
                                filled: true,
                                contentPadding: EdgeInsets.all(8)
                            ),
                            validator: (text) {
                              if (text == null || text
                                  .trim()
                                  .isEmpty) {
                                return 'please enter Email Name';
                              }
                              return null;
                            },),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(

                            controller: passwordNameController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Enter pass word',


                                enabledBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(context),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey
                                  ),

                                ),
                                filled: true,
                                contentPadding: EdgeInsets.all(8)
                            ),
                            validator: (text) {
                              if (text == null || text
                                  .trim()
                                  .isEmpty) {
                                return 'please enter pass word';
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(onPressed: () {
                          FirebaseauthentictionButton();
                        }, child: Text('Register')),
                        TextButton(onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                            child: Text(
                              'Aleardy have  account ?', style: TextStyle(
                                fontSize: 15),))
                      ],
                    ),
                  ),
                ),),)
          ]),
    );
  }

  void FirebaseauthentictionButton() async {
    if (globalKey.currentState!.validate()) {
      registerViewModel.CreateAccount(
          EmailNameController.text, passwordNameController.text,FirstNameController.text,LastNameController.text,UserNameController.text);
    }
  }

  @override
  ShowLoading() {
    showDialog(context: context, builder: (c) {
      return AlertDialog(
        title: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }

  @override
  hideLoading() {
    Navigator.pop(context);
  }

  @override
  showMessage(String message) {
    showDialog(context: context, builder: (c) {
      return AlertDialog(
        title: Row(
          children: [
            Expanded(child: Text(message))
          ],
        ),

      );
    });
  }

  @override
  RegisterViewModel initialviewmodel() {
    return RegisterViewModel();
  }

  @override
  void gotohome(MyUser user) {
    var providerUser=Provider.of<UserProvider>(context);
    providerUser.myUser=user;
   Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

}



