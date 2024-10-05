import 'package:flutter/material.dart';

class RadiobuttonWidget extends StatelessWidget {
  const RadiobuttonWidget({super.key, required this.question,  required this.groupValue, required this.onChanged, });
  final String question;
  
  final bool groupValue;
  final Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question,style: const TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
         Row(
                  children: [
                    Row(
                      children: [
                       Radio(value: true, groupValue:groupValue, onChanged:onChanged,activeColor: Colors.blue,hoverColor: Colors.blue.withOpacity(0.2)), const SizedBox(width: 10,),Text("Yes")
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Row(
                      children: [
                       Radio(value: false, groupValue:groupValue, onChanged:onChanged,activeColor: Colors.blue,hoverColor: Colors.blue.withOpacity(0.2),),const SizedBox(width: 10,),Text("No")
                      ],
                    ),
                  ],
                ),
      ],
    );
  }
}