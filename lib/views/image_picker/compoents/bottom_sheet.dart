part of '../view.dart';
class ImagePickerBottomSheet extends StatefulWidget {
  const ImagePickerBottomSheet({super.key});

  @override
  State<ImagePickerBottomSheet> createState() => _ImagePickerBottomSheetState();
}

class _ImagePickerBottomSheetState extends State<ImagePickerBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 260,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
        border: Border.all(color: Theme.of(context).primaryColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text("Select image source",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22,fontWeight: FontWeight.bold),)),
          SizedBox(height: 12,),
          TextButton(onPressed: () async {
            image=await ImagePicker().pickImage(source: ImageSource.camera);
            Navigator.pop(context,image);
          }, child: Text("From camera",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22,fontWeight: FontWeight.w600),)),
          SizedBox(height: 8,),
          TextButton(onPressed: () async {
            image=await ImagePicker().pickImage(source: ImageSource.gallery);
            Navigator.pop(context,image);
          }, child: Text("From Gallery",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22,fontWeight: FontWeight.w600)),)
        ],
      ),
    );
  }
}
