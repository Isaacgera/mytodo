import 'package:flutter/material.dart';
import 'package:mytodo/utils/myDialogBox.dart';
import 'package:mytodo/utils/myTaskTiles.dart';

void main() {
  runApp(const mainPage());
}

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}

// ignore: must_be_immutable
class homePage extends StatefulWidget {
  
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
    List myTasks=[
      ["Java is a multi-platform",true],
      ["Java",false],
      ["multi-platform",true],
    ];

    void checkBoxClicked(bool? value,int index)
    {
      setState(() {
        myTasks[index][1]=!myTasks[index][1];
      });
    }

    void addTask(){
      showDialog(context: context, builder: (context){
        return MyDialogBox();
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY TO DO LIST",style: TextStyle(letterSpacing: 2.0,wordSpacing: 3.0),),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount:myTasks.length,
        itemBuilder: (context, index) {
          return taskTile(taskname: myTasks[index][0], isCompleted: myTasks[index][1], onChanged: (value)=>checkBoxClicked(value,index));
        },
      ),
      backgroundColor: Colors.blue[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTask(),
        backgroundColor: Colors.blue,
        elevation: 0,
        child: Icon(Icons.add),
      ),
    );
  }
}

