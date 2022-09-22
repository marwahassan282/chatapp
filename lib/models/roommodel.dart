class Room{
  static const String collectionNameRomm='rooms';
  String ?roomId;
  String? roomdesc;
  String ?roomTitle;
  String ? catId;
  Room({required this.roomId,required this.roomdesc,required this.roomTitle,required this.catId});

  Room.fromjoson(Map<String,dynamic> joson){
    roomId=joson['roomId']as String;
    roomdesc=joson['roomdesc']as String;
    roomTitle=joson['roomTitle']as String;
    catId=joson['catId']as String;



  }
 Map<String,dynamic> tojoson(){


    return{
     'roomId':roomId,
      'roomdesc':roomdesc,
      'roomTitle':roomTitle,
      'catId':catId,

  };
}

}