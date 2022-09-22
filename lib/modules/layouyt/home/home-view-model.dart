
import 'package:appchat/base.dart';
import 'package:appchat/modules/layouyt/home/Homenavigator.dart';

import '../../../database/database-utils.dart';
import '../../../models/roommodel.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator>{
 List<Room> room=[];
   void getroom()async{
    room= await DatabaseUtils.getrooms();
  }


}