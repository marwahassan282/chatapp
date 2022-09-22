import 'package:appchat/base.dart';
import 'package:appchat/models/Message.dart';
import 'package:appchat/models/roommodel.dart';
import 'package:appchat/modules/layouyt/chat/MesageItem.dart';
import 'package:appchat/modules/layouyt/chat/chatviewmode.dart';
import 'package:appchat/provider/user-provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
 static const routeName='chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseState<ChatScreen,ChatViewModel>implements ChatNavigator {
  ChatViewModel chatViewModel=ChatViewModel();
  var controller=TextEditingController();
  String messagecontent='';
  @override
  void initState() {
  chatViewModel.navigator=this;

  }
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<UserProvider>(context);
    chatViewModel.myUser=provider.myUser!;
    var arguments=ModalRoute.of(context)?.settings.arguments as Room;
    chatViewModel.room=arguments;
    chatViewModel.updateroomMassage();
    return ChangeNotifierProvider(
      create: (c)=>chatViewModel,
        child: Stack(
          children: [
        Container(
        child: Image.asset('assets/images/homebackground.png',width: double.infinity,fit: BoxFit.fill,),
    ),
    Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(arguments.roomTitle!),
    centerTitle: true,),
      body: Container(
    margin: EdgeInsets.all(24),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12)
    )
   ,
   child: Column(
     
     children: [
       Expanded(child:StreamBuilder<QuerySnapshot<Message>>(
         stream: chatViewModel.stream,
         builder: (context,snapShot){
           if(snapShot.connectionState==ConnectionState.waiting){
             return Center(
               child: CircularProgressIndicator(),
             );

           }
           if(snapShot.hasError){
             return Center(
               child: Text(snapShot.error.toString())
             );
           }
           var messageList=snapShot.data?.docs.map((messages) =>messages.data() ).toList();
           return ListView.builder(
             itemCount: messageList?.length,
               itemBuilder: (context,index){
return MessageItem(messageList![index]);
           });

         },


       )),
   Row(
     children: [
       Expanded(
         child: TextField(
           controller: controller,
           onChanged: (text){
             messagecontent=text;
           },
           decoration: InputDecoration(
             hintText: 'type here',
             border: OutlineInputBorder(
               borderRadius: BorderRadius.only(
                 topRight: Radius.circular(12)
               )
             ),
             focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.only(
                     topRight: Radius.circular(12)
                 )
             )
           ),
         ),
       ),
       SizedBox(width: 8,),
       ElevatedButton(onPressed: (){
         chatViewModel.sendmessage(messagecontent);
       }, child:Padding(
         padding: const EdgeInsets.all(12.0),
         child: Row(

           children: [
             Text('send'),
             SizedBox(width: 8,),
             Icon(Icons.send)
           ],
         ),
       ))
     ],
   )

     ],
   ),

      )


    )]));

  }

  @override
  ChatViewModel initialviewmodel() {
    return ChatViewModel();
  }

  @override
  void clearmessage() {
    controller.clear();
  }
}
