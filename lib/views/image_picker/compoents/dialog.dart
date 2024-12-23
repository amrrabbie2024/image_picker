part of '../view.dart';
class ImagePickerDialog extends StatefulWidget {
  const ImagePickerDialog({super.key});

  @override
  State<ImagePickerDialog> createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select image source"),
      titleTextStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22,fontWeight: FontWeight.bold),
      backgroundColor: Colors.yellow,
      shadowColor: Colors.orange,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
      alignment: AlignmentDirectional.center,
      actions: [
        SizedBox(
          width: 260,
          child: ElevatedButton.icon(onPressed: () async {
          image=await ImagePicker().pickImage(source: ImageSource.camera);
          Navigator.pop(context,image);
          }, icon: Icon(Icons.camera_alt), label: Text("Camera",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w500,fontSize: 21),),),
        ),
        SizedBox(height: 16,),
        SizedBox(
          width: 260,
          child: ElevatedButton.icon(onPressed: () async {
          image=await ImagePicker().pickImage(source: ImageSource.gallery);
          Navigator.pop(context,image);
          }, icon: Icon(Icons.photo_album_outlined), label: Text("Gallery",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w500,fontSize: 21),),),
        ),
      ],
    );
  }
}
