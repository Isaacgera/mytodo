import 'package:flutter/material.dart';
import 'package:mytodo/utils/myButton.dart';

// ignore: must_be_immutable
class MyDialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onsave;
  VoidCallback oncancle;
  MyDialogBox({super.key,required this.controller,required this.onsave,required this.oncancle});
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
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: "New Task Title",
                    ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Add", onPressed: onsave),
                  SizedBox(width: 20,),
                  MyButton(text: "Cancle", onPressed: oncancle),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}