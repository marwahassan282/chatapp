import 'package:appchat/models/Message.dart';
import 'package:appchat/models/my-user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/roommodel.dart';

class DatabaseUtils{

 static CollectionReference<MyUser> getUserCollection(){
   return FirebaseFirestore.instance.collection(MyUser.collctionName).withConverter(
        fromFirestore: (snapshot,op)=>MyUser.fromjoson(snapshot.data()!),
        toFirestore: (user,op)=>user.tojoson());



  }
 static CollectionReference<Room> getrRoomCollection(){
  return FirebaseFirestore.instance.collection(Room.collectionNameRomm).withConverter(
      fromFirestore: (snapshot,op)=>Room.fromjoson(snapshot.data()!),
      toFirestore: (room,op)=>room.tojoson());



 }
 static CollectionReference<Message> getMesageCollection(String roomId){
 return getrRoomCollection().doc(roomId).collection(Message.messagecollection).withConverter(
      fromFirestore: (snapshot,op)=>Message.fromjoson(snapshot.data()!),
      toFirestore: (message,op)=>message.tojoson());



 }
 static Future<void > createRoom(String title,String des,String CatId){

  var roomCollection=getrRoomCollection();
  var docRef=roomCollection.doc();
  Room room=Room(roomId: docRef.id, roomdesc: des, roomTitle: title, catId: CatId);
 return docRef.set(room);
 }
  static Future<void>CreateDbUser(MyUser user){

  return getUserCollection().doc(user.id).set(user);
  }
  static Future<MyUser> readuser(String userId) async{


  var userSnapShot= await getUserCollection().doc(userId).get();
 return userSnapShot.data()!;
  }
  static Future<List<Room>>getrooms()async{

  var roomdocs=await getrRoomCollection().get();
 return  roomdocs.docs.map((e) => e.data()).toList();
  }
 static Future<void> insertMessagetoRoom(Message message){
  var refdoc= getMesageCollection(message.roomId!).doc();
  message.id=refdoc.id;
  return refdoc.set(message);

  }
static  Stream<QuerySnapshot<Message>> getmessage(String roomId){
 return  getMesageCollection(roomId).orderBy('dateTime').snapshots();
  }




}