import 'package:flutter/material.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: ColorScheme.dark()),
        home: ToDoList()
    );
  }
}

class ToDoList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ToDoListState();
  }
}

class ToDoListState extends State<ToDoList>{
  TextEditingController _taskController = TextEditingController();
  // String _task='';
  //var _toDoList = List<String>.empty(growable:true);
  List<String> _toDoList = [];
  void _taskGet(){
    String _taskget = (_taskController.text).toString();

  }
  void _addItem(String task){
    setState(() {
      _toDoList.add(task);
    });
    _taskController.clear();
  }


  void _taskDelete(index){
    setState(() {
      _toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('ToDoList',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:30,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: _toDoList.length,
                    itemBuilder:(context , index){
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23),
                        ),
                        elevation: 7,
                        color: Colors.deepPurpleAccent,
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(
                              flex:20,
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child:Text(_toDoList[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex:4,
                              child: IconButton(
                                color: Colors.white,
                                icon: Icon(Icons.delete),
                                onPressed: (){
                                  _taskDelete(index);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ),
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    Expanded(
                      flex: 25,
                      child: TextField(
                        controller: _taskController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90),
                            borderSide: BorderSide(
                              width: 90,
                              style: BorderStyle.solid,
                            ),
                          ),
                          labelText: 'Add Task : ',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: IconButton(
                        onPressed: (){
                          _addItem((_taskController.text).toString());
                        },
                        icon: Icon(Icons.add,
                          weight: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}