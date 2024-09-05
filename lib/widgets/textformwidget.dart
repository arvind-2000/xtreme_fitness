import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.hint,
      required this.controller,
      this.fieldsubmitted,
      this.focusnode,
      this.nextfocusnode,
      this.validator,
      this.icon,
      this.interactivetext,
      this.obscure = false,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.enabletext = true, this.onchanged, this.counter = 25});
  final String hint;
  final Icon? icon;
  final bool obscure;
  final Function? validator;
  final Function(String)? onchanged;
  final TextEditingController controller;
  final FocusNode? focusnode;
  final FocusNode? nextfocusnode;
  final Function? fieldsubmitted;
  final bool? interactivetext;
  final AutovalidateMode autovalidateMode;
  final bool enabletext;
  final int counter;
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

  void toggle() {
    setState(() {
      toggless = !toggless;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      cursorHeight: 20,
      controller: widget.controller,
      focusNode: widget.focusnode,
      onFieldSubmitted: (value) {
        if (widget.nextfocusnode != null) {
          widget.nextfocusnode!.requestFocus();
        }
        if (widget.fieldsubmitted != null) {
          widget.fieldsubmitted!();
        }
      },
      validator: (v) {
        if (widget.validator == null) {
          if (widget.controller.text.trim().isEmpty) {
            return '${widget.hint} is  empty';
          }
        } else {
          if(widget.controller.text.length>widget.counter){
            return "Should be between 1 to ${widget.counter} characters. Exceeds limits";
          }else{
            return widget.validator!();
          }
          
        }
        return null;
      },
        maxLength: widget.counter,
       
        
      enabled: widget.enabletext,
      enableInteractiveSelection: widget.interactivetext,
      autovalidateMode: widget.autovalidateMode,
      obscureText: toggless,
      onChanged:widget.onchanged ,
      decoration: InputDecoration(
         counter: const Offstage(),
          suffixIcon: widget.obscure
              ? IconButton(
                  onPressed: () {
                    toggle();
                  },
                  icon:
                      Icon(toggless ? Icons.visibility_off : Icons.visibility))
              : const SizedBox(),
          filled: false,
          focusColor: Theme.of(context).colorScheme.secondary,
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onPrimary),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          prefixIcon: widget.icon,
          fillColor: Theme.of(context).colorScheme.primary,
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    );
  }
}
