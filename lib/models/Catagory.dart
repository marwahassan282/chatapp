import 'package:flutter/cupertino.dart';

class Catagory{
 static const String sportId='sports' ;
 static const String musicId='music' ;
 static const String movieId='movies' ;
 String ?id;
 String ?name;
 String? images;
 Catagory(this.id,this.name,this.images);
 Catagory.fromId(String id){
  images= 'assets/images/$id.jpeg';
name=id;


 }
  static List<Catagory> getCatagory(){

   return [
     Catagory.fromId(sportId),
     Catagory.fromId(musicId),
     Catagory.fromId(movieId),
   ];
 }


}