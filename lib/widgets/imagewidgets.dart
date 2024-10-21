import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../managementfeatures/managementmodels/managementrepoimpl.dart';

class MemoryImageWidget extends StatefulWidget {
  final int? id;

  const MemoryImageWidget({super.key, this.id});

  @override
  State<MemoryImageWidget> createState() => _MemoryImageWidgetState();
}

class _MemoryImageWidgetState extends State<MemoryImageWidget> {

     Uint8List? _photoBytes;
    ManagementrepoImpl d = ManagementrepoImpl();
  @override
  void initState() {
    super.initState();
    _fetchPhoto();
  }

  Future<void> _fetchPhoto() async {
    if(widget.id!=null){
      print(widget.id);
   await d.getImage(widget.id!).then((value) {
if(value!=null){
  print('not null');
}else{
  print("Null");
}
          setState(() {
      _photoBytes = value;
      print("in photo images");
    });
    },);

    }

  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: _photoBytes!=null
            ? Image.memory(_photoBytes!) 
            :Icon(Icons.person), 
      );
  }
}