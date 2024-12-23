import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
part 'compoents/dialog.dart';
part 'compoents/bottom_sheet.dart';

class ImagePickerViewer extends StatefulWidget {
  const ImagePickerViewer({super.key});

  @override
  State<ImagePickerViewer> createState() => _ImagePickerViewerState();
}

XFile? image;

class _ImagePickerViewerState extends State<ImagePickerViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select photo"),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 24,fontWeight: FontWeight.bold),
        actions: [
          IconButton(onPressed: () async {
            image=await showDialog(context: context,
              builder: (context) => ImagePickerDialog(),);
            setState(() {});
          }, icon: Icon(Icons.add_a_photo,color: Theme.of(context).primaryColor,size: 24,)),
        ],
      ),
      body: Center(
        child: CircleAvatar(
          radius: 120,
          backgroundColor: Theme.of(context).primaryColor,
          child: CircleAvatar(radius: 115,
            backgroundImage: image!=null?FileImage(File(image!.path)):null,
            child: IconButton(onPressed: () async {
              image=await showModalBottomSheet(context: context, builder: (context) => ImagePickerBottomSheet(),);
              setState(() {});
          }, icon: Icon(Icons.add_a_photo,color: Theme.of(context).primaryColor,size: 32,)),),
        ),
      ),
    );
  }
}
