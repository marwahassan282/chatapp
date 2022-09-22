import 'package:appchat/models/my-user.dart';
import 'package:appchat/modules/layouyt/Register/Register.dart';
import 'package:appchat/modules/layouyt/home/homescreen.dart';
import 'package:appchat/modules/layouyt/login/Login-View-Model.dart';
import 'package:appchat/modules/layouyt/login/LoginNavigator.dart';
import 'package:appchat/provider/user-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base.dart';

class LoginScreen  extends StatefulWidget {
 static const  String routeName='login';


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState  extends BaseState <LoginScreen, LoginViewModel> implements LoginNavigator {

  GlobalKey<FormState> globalKey=GlobalKey<FormState>();

  var emailController=TextEditingController();

  var passwordController=TextEditingController();
  LoginViewModel registerViewModel=LoginViewModel();
  @override
  void initState() {

    super.initState();
    registerViewModel.navigator= this;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c)=>LoginViewModel(),
      child: Stack(
          children: [
            Container(
              child: Image.asset('assets/images/homebackground.png',width: double.infinity,fit: BoxFit.fill,),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text('Login Screen'),

              ),
              body:Form(
                key: globalKey,
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: emailController,

                            keyboardType:TextInputType.emailAddress,
                            obscureText: false,
                            decoration:InputDecoration(
                                hintText: 'Enter Email address',


                                enabledBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(context),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:Colors.grey
                                  ),

                                ),
                                filled: true,
                                contentPadding:EdgeInsets.all(8)
                            ),
                            validator: (text){
                              if(text==null||text.trim().isEmpty) {
                                return 'please enter Email Name';
                              }
                              return null;
                            },),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(

                            controller: passwordController,
                            keyboardType:TextInputType.visiblePassword,
                            obscureText: true,
                            decoration:InputDecoration(
                                hintText: 'Enter pass word',


                                enabledBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(context),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:Colors.grey
                                  ),

                                ),
                                filled: true,
                                contentPadding:EdgeInsets.all(8)
                            ),
                            validator: (text){
                              if(text==null||text.trim().isEmpty) {
                                return 'please enter pass word';
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(onPressed:(){
                          LoginButton();
                        }, child: Text('Login')),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, RegisterScreen.routeName);
                        }, child: Text('Do not nave an account ?',style: TextStyle(fontSize: 15),))
                      ],
                    ),
                  ),
                ),),)]),
    );
  }
 LoginButton(){
    if(globalKey.currentState!.validate()==true){
      //login
      registerViewModel.login(emailController.text,passwordController.text);
    }

  }

  @override
  LoginViewModel initialviewmodel() {
   return LoginViewModel();
  }

  @override
  void gotohome(MyUser user) {
    var provider=Provider.of<UserProvider>(context);
    provider.myUser=user;
 Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
