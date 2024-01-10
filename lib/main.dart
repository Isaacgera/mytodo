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

    final textEditingController =TextEditingController();
    List myTasks=[
    ['Task',false],
    ];

    void checkBoxClicked(bool? value,int index)
    {
      setState(() {
        myTasks[index][1]=!myTasks[index][1];
      });
    }

    void savenewtask()
    {
      setState(() {
        myTasks.add([textEditingController.text,false]);
        Navigator.of(context).pop();
        textEditingController.text="";
      });
    }

    void addTask(){
      showDialog(context: context, builder: (context){
        return MyDialogBox(controller:textEditingController,onsave: () => savenewtask(),oncancle:()=> Navigator.of(context).pop());
      });
    }
    void deleteTask(int index)
    {
      setState(() {
        //delete
        myTasks.removeAt(index);
      });
    }

    void reorder(int oldindex,int newindex)
    {
      setState(() {
        if(newindex>oldindex)
        {
          newindex--;
        }
        List tmp=myTasks[oldindex];
        myTasks.removeAt(oldindex);
        myTasks.insert(newindex,tmp);
      });
    }
    Widget proxyDecorator(Widget child,int index,Animation<double> animation){
      return AnimatedBuilder(
        animation: animation, 
        builder: (BuildContext context,Widget? child){
          return Material(
            elevation: 0,
            child: child,
            color: Colors.transparent,
          );
        },
        child: child,
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY TO DO LIST",style: TextStyle(letterSpacing: 2.0,wordSpacing: 3.0,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body:ReorderableListView.builder(
        proxyDecorator:proxyDecorator,
        itemCount: myTasks.length,
        onReorder:(i,j)=>reorder(i,j),
        itemBuilder:(BuildContext context,int index){
          return taskTile(
            key: Key('${index}'),
            taskname: myTasks[index][0],
             isCompleted: myTasks[index][1], 
             onChanged: (value)=>checkBoxClicked(value,index),
             onTap:()=>deleteTask(index)
            );
        }
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

