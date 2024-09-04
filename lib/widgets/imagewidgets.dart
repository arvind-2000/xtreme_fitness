import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    final bytes = await d.getImage(widget.id!);
    setState(() {
      _photoBytes = bytes;
    });
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: _photoBytes != null
            ? Image.memory(_photoBytes!) // Display the image from memory
            : CircularProgressIndicator(), // Show loading indicator while fetching
      );
  }
}