import 'package:flutter/material.dart';

import './video_compressor.dart';

void main() {
  runApp(MaterialApp(
    home: Video(),
  ));
}
 class Video extends StatefulWidget {
   const Video({Key? key}) : super(key: key);

   @override
   State<Video> createState() => _VideoState();
 }

 class _VideoState extends State<Video> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text('Video Compressor')),
       body: SafeArea(
         child: Container(
           child: Column(
             children: <Widget>[
               ElevatedButton(onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => Videos()));
               },child: Text("video compress"),),
               SizedBox(height: 50,),
               // ElevatedButton(onPressed: (){
               //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Light()));
               // },child: Text("light compress"),)

             ],
           ),
         ),
       ),
     );
   }
 }
