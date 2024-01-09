import 'package:flutter/material.dart';
import 'package:mytodo/utils/myButton.dart';

class MyDialogBox extends StatelessWidget {
  const MyDialogBox({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 800,
          height: 150,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Expanded(
                child:TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: "New Task Title",
                    ),
                ),
              ),
              Row(
                children: [
                  MyButton(text: "Add", onPressed: (){}),
                  SizedBox(width: 20,),
                  MyButton(text: "Cancle", onPressed: (){}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}