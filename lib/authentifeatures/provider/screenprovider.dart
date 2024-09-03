import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screenprovider extends GetxController{
  int pageselect = 0;

  void changePage(int v){
      pageselect = v;

      update();
  }
}