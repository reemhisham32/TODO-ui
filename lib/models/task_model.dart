class TaskModel {
  String id;
  String title;
  String description;
  int data;
  bool isDone;
  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.data,
      this.isDone = false});


  TaskModel.fromJson(Map<String,dynamic> json):this
  (
  id:  json['id'],
  title:json['title'] ,
  description:json['descriptions'] ,
  data: json['data'],
  isDone:json['isDone'] ,

    );
  Map<String,dynamic> tojson(){
    return{
      "id":id,
      "title":title,
      "descriptions":description,
      "data":data,
      "isDone":isDone,



    };


  }
}

