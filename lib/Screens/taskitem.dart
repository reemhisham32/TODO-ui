import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/network/firebase/firebase_functions.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;
TaskItem({  required this.taskModel ,super.key});
  @override
  Widget build(BuildContext context) {
    var taskModel;
    return
       Card(
        margin: EdgeInsets.symmetric(horizontal: 12,),
        elevation:8,shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),

          child : Container(
          margin: EdgeInsets.all(15),
          child: Row(
            children: [
              Slidable(

          startActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed:(context){},
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context){
                FirebaseFunctions.deleteTask(taskModel.id);
              },
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16) ),
              backgroundColor: Color(0xff5D9CEC),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ]),
                child: Container(
                  height:80 ,
                  color: Color(0xff5D9CEC),
                  width: 4,
                ),
              ),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  Text("add task"),
                  Text("Task Description")

                ],
              ),
             Spacer(),
             InkWell(
               onTap: (){

               },
               child: InkWell(
                 onTap: (){
                   taskModel.isDone=!taskModel.isDone;
                   FirebaseFunctions.updateTask(taskModel);
                 },
                 child: Container(
                   padding: EdgeInsets.symmetric(vertical: 2,horizontal: 12),
                   decoration:BoxDecoration(
                     color: taskModel.isDone ? Colors.green :Color(0xff5D9CEC),
                     borderRadius: BorderRadius.circular(8),

                   ) ,
                   child: Icon(
                     Icons.done,color:Colors.white    ,size: 30,),
                 ),
               ),
             )
              
            ],
          ),

        ),

    );
  }
}
