import 'package:flutter/material.dart';

void CustomSnackbar(BuildContext context,String message){

            ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                showCloseIcon: true,
                                                width: 500,
                                                backgroundColor: Colors.green,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                action: SnackBarAction(
                                                    label: "View",
                                                    onPressed: () {}),
                                                content: Text(message),
                                                duration: Durations.extralong4,
                                              ));
          
}