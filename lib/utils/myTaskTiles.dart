import 'package:flutter/material.dart';

// ignore: must_be_immutable
class taskTile extends StatelessWidget {
  final String taskname;
  final bool isCompleted; 
  Function(bool?)? onChanged;
  taskTile(
    {
      super.key,
      required this.taskname,
      required this.isCompleted,
      required this.onChanged
    }
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 14,right: 14),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
            children: [
              SizedBox(width: 12.0,),
              Checkbox(value: isCompleted, onChanged: onChanged,activeColor: Colors.black),
              SizedBox(width: 8.0,),
              Expanded(child: RichText(text: TextSpan(text: taskname,style:isCompleted?TextStyle(decoration: TextDecoration.lineThrough):TextStyle(decoration: TextDecoration.none)),),)
            ],
          ),
      ),
    );
  }
}