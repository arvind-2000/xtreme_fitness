import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void snackBarFeature(String titleText,String messageText,BuildContext context ,AnimatedSnackBarType type){


toastification.show(
  // context: context, // optional if you use ToastificationWrapper
  title: Text(messageText),
  icon: Icon(Icons.login),
  type:type==AnimatedSnackBarType.success? ToastificationType.success:type==AnimatedSnackBarType.error?ToastificationType.error:ToastificationType.warning,
  autoCloseDuration: const Duration(seconds: 3),
  closeOnClick: true,
  showProgressBar: false,

);
  // AnimatedSnackBar.rectangle(
    
  //   desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
    
  //    titleText,messageText, type: type).show(context);



  // SnackBar(
  //   backgroundColor: brownishred
  //   ,content: Text(messageText,style:const TextStyle(color:Colors.white),),duration:const Duration(milliseconds: 1000),);

}