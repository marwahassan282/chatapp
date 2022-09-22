import 'package:appchat/models/Message.dart';
import 'package:appchat/provider/user-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageItem extends StatelessWidget {

  Message message;
  MessageItem(this.message);
  UserProvider ? userProvider;

  @override
  Widget build(BuildContext context) {
    userProvider=Provider.of<UserProvider>(context);

    return userProvider?.myUser?.id==message.senderId?SenderMessage(message):ReciverMessage(message);
  }
}
class SenderMessage extends StatelessWidget {
 Message message;
 SenderMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
                bottomLeft:Radius.circular(12)
              ),
              color: Colors.blue
            ),
            child: Text(message.content,style: TextStyle(color:Colors.white,fontSize: 18 ),),
          ),
          SizedBox(height: 8,),
          Text(message.dateTime.toString())
        ],
      ),
    );
  }
}
class ReciverMessage extends StatelessWidget {
  Message message;
  ReciverMessage (this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
      padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    bottomRight:Radius.circular(12)
                ),
                color: Colors.grey.shade500
            ),
            child: Text(message.content,style: TextStyle(color:Colors.black,fontSize: 18 ),),
          ),
          SizedBox(height: 8,),
          Text(message.dateTime.toString())
        ],
      ),
    );
  }
}

