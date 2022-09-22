import 'package:appchat/base.dart';
import 'package:appchat/models/Catagory.dart';
import 'package:appchat/models/roommodel.dart';
import 'package:appchat/modules/add-Room/add-roomscreen-viewmodel.dart';
import 'package:appchat/modules/add-Room/addrommscreen-navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routName='add';

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseState<AddRoomScreen,RoomViewModel> implements RoomNavigator {
  var roomnamecontroller = TextEditingController();
  var globalkey = GlobalKey<FormState>();
  var roomdescriptioncontroller = TextEditingController();
  RoomViewModel roomViewModel = RoomViewModel();
  var catagories = Catagory.getCatagory();
  Catagory ? selectedcatagoey;
  late var selectedcatagory;

  @override
  void initState() {
    roomViewModel.navigator = this;
    selectedcatagory = catagories[0];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => roomViewModel,
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
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Text('Add Room'),
                    centerTitle: true,
                  ),

                  body: Container(
                      margin: EdgeInsets.all(24),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Form(
                          key: globalkey,
                          child: Column(
                              children: [
                                Text(
                                  'Add Room ', style: TextStyle(fontSize: 15),),
                                Image.asset(
                                    'assets/images/group-1824146_1280.png'),
                                TextFormField(
                                  controller: roomnamecontroller,
                                  decoration: InputDecoration(
                                      labelText: 'enter room name'
                                  ),
                                  validator: (text) {
                                    if (text == null || text
                                        .trim()
                                        .isEmpty) {
                                      return 'please enter room name';
                                    }
                                    else
                                      return null;
                                  },
                                ),
                                DropdownButton(
                                  value: selectedcatagoey,
                                  items: catagories.map((catagory) =>
                                      DropdownMenuItem<Catagory>(
                                          value: catagory,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              Image.asset(catagory.images!),
                                              SizedBox(width: 15,),
                                              Text(catagory.name!)
                                            ],
                                          ))).toList(),
                                  onChanged: (catagory) {
                                    if (catagory == null) {
                                      return;
                                    }
                                    else {
                                      selectedcatagoey = catagory as Catagory?;
                                      setState(() {

                                      });
                                    }
                                  },
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: roomdescriptioncontroller,
                                    decoration: InputDecoration(
                                        labelText: 'enter room description'
                                    ),
                                    validator: (text) {
                                      if (text == null || text
                                          .trim()
                                          .isEmpty) {
                                        return 'please enter room description';
                                      }
                                      else
                                        return null;
                                    },
                                  ),
                                ),
                                ElevatedButton(onPressed: () {
                                  ValidateForm();
                                }, child: Text('create Room')),


                              ]))),




              )
            ]));
  }

  ValidateForm() {
    if (globalkey.currentState!.validate()) {
      roomViewModel.createRoom(
          roomnamecontroller.text, roomdescriptioncontroller.text,
          selectedcatagoey?.name ?? '');
    }
  }

  @override
  RoomViewModel initialviewmodel() {
    return RoomViewModel();
  }

  @override
  void roomcreated() {
    showmessage(
        'home create successfuly....', actionname: 'Ok', voidCallback: () {
      hideloading();
      Navigator.pop(context);
    }
    );
  }




}
