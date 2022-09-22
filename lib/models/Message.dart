class Message{
  static const String messagecollection='message';
 String? id;
 String content;
 String ?senderId;
 String ?senderName;
 String? catagoryId;
 String ?roomId;
 int ?dateTime;
 Message({this.id='',required this.content,required this.senderId,required this.catagoryId,required this.dateTime,required this.roomId,required this.senderName});

  Message.fromjoson(Map<String,dynamic> joson): this(
 id:joson['id'],
    content:joson['content'],
    senderId:joson['senderId'],
    catagoryId:joson['catagoryId'],
    roomId:joson['roomId'],
    dateTime:joson['dateTime'],
    senderName:joson['senderName']

 );
  Map<String,dynamic> tojoson(){

    return {
      'id':id,
      'content':content,
      'senderId':senderId,
      'catagoryId':catagoryId,
      'roomId':roomId,
      'dateTime':dateTime,
      'senderName':senderName
    };}
  }



