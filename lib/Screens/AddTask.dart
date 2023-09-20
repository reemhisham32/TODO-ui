import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/network/firebase/firebase_functions.dart';

class AddTask extends StatefulWidget {
    var formKey = GlobalKey<FormState>();

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime selectedDate = DateTime.now();
  DateTime selectDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key:formKey ,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

alignment: Alignment.center,

                child: Text(

                  selectDate.toString().substring(0,10),
                  style: TextStyle(color: Color(0xff383838),fontSize: 25,fontWeight: FontWeight.bold),


                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate()){

    TaskModel task=TaskModel(title:titleController.text,
    description: descriptionController.text,
    data:DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
    FirebaseFunctions.addTask(task);
    Navigator.pop(context);


    }



                },

               child: Text("Add Task"))




            ,  TextFormField(
                controller: titleController,
                validator:  (value){
                  if (value.toString().length<4){
                    return "please enter  title at least 4 car";
                  }
                  return null;

                },
                decoration: InputDecoration(label: Text("Task Title"),

   enabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),

        )
   )

                ),

            SizedBox(
              height: 16,
            ),
              TextFormField(
                maxLines: 4,
                controller: descriptionController,
                decoration: InputDecoration(label:Text( "description task "),
        enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        )
        )
              ),
              SizedBox(
                height: 16,
              ),
              Text("Select Time", style: TextStyle(fontWeight: FontWeight.bold)),
              Center(
                child: InkWell(
                    onTap: () {
                      ChooseDateTime();
                    },





    ),


          ),
        ]),

        ),
      ),

    );

  }

 void ChooseDateTime(){
    showDatePicker(context: context,
        initialDate:DateTime.now()
        , firstDate: DateTime.now(),
        lastDate: DateTime.now(
        ).add(Duration(days: 365)));
  }
}
