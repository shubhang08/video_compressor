
import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video/video_compress_api.dart';
import 'package:video_compress/video_compress.dart';
import './progress.dart';


class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  File? fileVideo;
  Uint8List? thumbnailBytes;
  int? videoSize;
  MediaInfo? compressedVideoInfo;

  Future pickVideo() async {
    final picker =ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if(pickedFile==null) return ;
    final file =File(pickedFile.path);
    setState(()=> fileVideo=file as File? );
    genrateThumbnail(file);
    getVideoSize(file);
  }

Future genrateThumbnail(File file) async {
    final thumbnailBytes = await VideoCompress.getByteThumbnail(file.path);
    setState(()=> this.thumbnailBytes = thumbnailBytes);
}

Future getVideoSize(File file) async {
final size = await file.length();
setState(()=> videoSize = size);
}

Future compressVideo() async {
    showDialog(
      context:context,
      barrierDismissible: false,
      builder: (context) => Dialog(child: ProgressDialogWidget()),
    );
    final info =await VideoCompressApi.compreVideo(fileVideo!);
   setState((){ compressedVideoInfo=info;
     buildVideoCompressedInfo();
   });
   Navigator.of(context).pop();

}

Widget buildVideoCompressedInfo(){

  if(compressedVideoInfo==null) {
    print('null');
      return Container(
        child: Text('NULL'),
      );

    }

    final size=compressedVideoInfo!.filesize!/1000;
  print(size);

  return Column(
    children: [
      Container(
          child:
           // Text('Compressed Video Size'),
            Text('Reduced Size : ${size} KB'),
        ),
      Text('${compressedVideoInfo!.path}',textAlign: TextAlign.center,)
    ],
  );
}

 Widget buildThumbnail() {
    if(thumbnailBytes!=null)return Image.memory(thumbnailBytes!, height: 100);
    else return Text('NULL');
  }

  Widget buildVideoInfo() {
    final size=videoSize!/1000;
   if(videoSize==null)return Container(child: Text('NULL'),);
 else
   return Column(
     children: [
       Text('Originial Video Info'),
       Text('Size: $size KB'),
   RaisedButton(onPressed: compressVideo,
     child: Text('compressed'),
   ),
       buildVideoCompressedInfo(),

     ],
   );

 }

 Widget buildContext(){
    if(fileVideo==null){
      return RaisedButton(
        child: Text('compress'),
          onPressed: () {
        pickVideo();
      });
    }
    else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildThumbnail(),
          buildVideoInfo(),

        ],
      );
    }
 }

  @override
  Widget build(BuildContext context) {

      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Container(
                  child: Text('video_compressor'),
                ),

                buildContext(),
              ],
            ),
          ),
        ),
      );

  }
}


