import 'package:appchat/base.dart';
import 'package:appchat/database/database-utils.dart';
import 'package:appchat/modules/add-Room/addrommscreen-navigator.dart';

class RoomViewModel extends BaseViewModel<RoomNavigator>{

   void createRoom(String title,String des,String CatId){
   navigator.showloading('create room.....', false)  ;
  String? message=null;
  try{
   DatabaseUtils.createRoom(title, des, CatId);

  }catch(e){
     message=e.toString();
  }
  navigator.hideloading();
  if(message!=null){
     message='some thing went wrong';
     navigator.showmessage(message);
  }
  else{
    navigator.roomcreated();

   }
   }



   }

