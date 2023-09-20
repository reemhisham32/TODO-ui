
import 'package:flutter/material.dart';
import 'package:todo/Screens/AddTask.dart';
import 'package:todo/Screens/HomeScreen/HomeScreen.dart';
import 'package:todo/Screens/settings.dart';
import 'package:todo/Screens/tasks.dart';

class HomeLayout extends StatefulWidget {
  static const String routes = "HomeLayout";

  @override
  State<HomeLayout> createState() =>_HomeLayoutState();
}


class _HomeLayoutState extends State<HomeLayout> {
  List<Widget> screens = [HomeScreen(), SettingsTab(), TaskTab()];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(color: Colors.white, width: 3)
        ),
        child: Icon(Icons.add),
        onPressed: () {
          showAddTaskBottomSheet(context);
        },
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        color: Colors.white,
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          child: BottomNavigationBar(
              currentIndex: currentindex,
              onTap: (value) {
                currentindex = value;
                 setState(() {

                });



              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
              ]),
        ),
      ),
      body: screens[currentindex],
    );
  }

  void showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true ,
      barrierColor: Colors.transparent,
      shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18), topLeft: Radius.circular(18),)
      ), context: context,
      builder: (context) => Padding(
        padding:  EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
          child: AddTask()
      ),
    );
  }

}
