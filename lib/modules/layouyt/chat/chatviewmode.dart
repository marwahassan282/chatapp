import 'package:appchat/base.dart';
import 'package:appchat/database/database-utils.dart';
import 'package:appchat/models/Message.dart';
import 'package:appchat/models/my-user.dart';
import 'package:appchat/models/roommodel.dart';
import 'package:appchat/provider/user-provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatViewModel extends BaseViewModel<ChatNavigator>{
 late Room room;
late MyUser myUser;
 Stream<QuerySnapshot<Message>> ? stream;
void sendmessage(String messagecontent)async{
 if(messagecontent.trim().isEmpty){
  return;
 }
 Message message=Message(content:messagecontent, senderId:myUser.id, catagoryId: room.catId, dateTime: DateTime.now().microsecondsSinceEpoch, roomId: room.roomId, senderName: myUser.userName);
try{
 var result= await DatabaseUtils.insertMessagetoRoom(message);
 navigator.clearmessage();
}catch(e){
 navigator.showmessage(e.toString());
}


}
void updateroomMassage(){
 stream= DatabaseUtils.getmessage(room.roomId!);
}


}
 abstract class ChatNavigator extends BaseNavigator{
 void clearmessage();

}