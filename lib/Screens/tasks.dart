import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/Screens/taskitem.dart';
import 'package:todo/network/firebase/firebase_functions.dart';
class TaskTab extends StatefulWidget {

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days:365 )),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            selectedDate=date;
            setState(() {

            });


          },
          leftMargin: 20,
          monthColor: Color(0xff5D9CEC),
          dayColor: Color(0xff5D9CEC).withOpacity(.5),
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Color(0xff5D9CEC),
          dotsColor: Color(0xff5D9CEC),
          selectableDayPredicate: (date) => date.day != 15 ,
          locale: 'en_ISO',
        ),
        StreamBuilder(

            stream:FirebaseFunctions.getTasks(selectedDate)
            ,builder:(context,snapchot){
    if(snapchot.connectionState==ConnectionState.waiting){
    return Center(child: CircularProgressIndicator(),);
    }
    if(snapchot.hasError){
    return Text("something went wrong");

    }
    var tasks=snapchot.data?.docs.map((e) => e.data()).toList()??[];
if(tasks.isEmpty){
  return Text("No Tasks");
  }
    return Expanded(
      child: ListView.builder(itemBuilder: (context,index){
      return TaskItem(taskModel: tasks[index],);


      },
        itemCount: tasks.length,

      ),
    );
    } )],
    );
  }
}
