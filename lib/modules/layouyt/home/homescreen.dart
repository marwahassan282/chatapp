import 'package:appchat/base.dart';
import 'package:appchat/modules/add-Room/addroom.dart';
import 'package:appchat/modules/add-Room/roomwidget.dart';
import 'package:appchat/modules/layouyt/home/Homenavigator.dart';
import 'package:appchat/modules/layouyt/home/home-view-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen,HomeViewModel> implements HomeNavigator {
  void initState() {

    super.initState();
   homeViewModel.navigator= this;
   homeViewModel.getroom();
  }
  HomeViewModel homeViewModel=HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create:(c)=>homeViewModel ,
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
      title: Text('Add Room'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
   Navigator.pushNamed(context, AddRoomScreen.routName);
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<HomeViewModel>(
        builder: (buildContext,HomeViewModel,child){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
                itemCount: homeViewModel.room.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12
            ),
                itemBuilder: (context,index){
              return RoomWidget(homeViewModel.room[index]);
            }),
          );
        },
      )
      )

        ]),
    );








  }

  @override
  HomeViewModel initialviewmodel() {
    return HomeViewModel();
  }
}

