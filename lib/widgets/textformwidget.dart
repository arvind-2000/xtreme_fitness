import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.controller,
    this.fieldsubmitted,
    this.focusnode,
    this.nextfocusnode,
    this.validator,
    this.icon,
    this.interactivetext,
    this.obscure = false, 
    this.autovalidateMode = AutovalidateMode.onUserInteraction
  });
  final String hint;
  final Icon? icon;
  final bool obscure;
  final Function? validator;
  final TextEditingController controller;
  final FocusNode? focusnode;
  final FocusNode? nextfocusnode;
  final Function? fieldsubmitted;
  final bool? interactivetext;
  final AutovalidateMode autovalidateMode;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
bool toggless = false;
  @override
  void initState() {
    super.initState();
      toggless = widget.obscure;
  }

    void toggle(){

      setState(() {
        toggless = !toggless;
      });
    }



  @override
  Widget build(BuildContext context) {
    return TextFormField(
    
      controller: widget.controller,
      focusNode: widget.focusnode,
      onFieldSubmitted: (value){
        if(widget.nextfocusnode!=null){
      widget.nextfocusnode!.requestFocus();
        }
        if(widget.fieldsubmitted!=null){
      widget.fieldsubmitted!();
        }
    
      },
      validator:(v){
       if(widget.validator==null){
          if(widget.controller.text.trim().isEmpty){
            return '${widget.hint} is  empty';
          }
       }else
       {
         return widget.validator!();
       }
     
      },
      enableInteractiveSelection: widget.interactivetext,
      autovalidateMode:widget.autovalidateMode,
      obscureText: toggless,
      decoration: InputDecoration(
          suffixIcon:widget.obscure?IconButton(onPressed: (){
              toggle();
          }, icon: Icon(toggless?Icons.visibility_off:Icons.visibility)):const SizedBox(),
        filled: false,
          focusColor: Theme.of(context).colorScheme.secondary,      
          prefixIcon:widget.icon,
          fillColor: Theme.of(context).colorScheme.background,
        hintText: widget.hint,

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
                          
                          
      )), 
    
    );
  }
}