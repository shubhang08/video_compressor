// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video/light_compressor_api.dart';
//
// import 'package:video_compress/video_compress.dart';
// import 'package:light_compressor/light_compressor.dart';
//
// class Light extends StatefulWidget {
//   const Light({Key? key}) : super(key: key);
//
//   @override
//   State<Light> createState() => _LightState();
// }
//
// class _LightState extends State<Light> {
//   File? fileVideo;
//   Uint8List? thumbnailBytes;
//   int? videoSize;
//   MediaInfo? compressedVideoInfo;
//
//   Future pickVideo() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
//     if (pickedFile == null) return;
//     final file = File(pickedFile.path);
//     setState(() => fileVideo = file as File?);
//     genrateThumbnail(file);
//     getVideoSize(file);
//   }
//
//   Future genrateThumbnail(File file) async {
//     final thumbnailBytes = await VideoCompress.getByteThumbnail(file.path);
//     setState(() => this.thumbnailBytes = thumbnailBytes);
//   }
//
//   Future getVideoSize(File file) async {
//     final size = await file.length();
//     setState(() => videoSize = size);
//   }
//
//   Future compressVideo() async {
//    // final info = await LightCompressApi.compreVideo(fileVideo!.path);
//    //  setState((){ compressedVideoInfo= info;
//    //    buildVideoCompressedInfo();
//    //  });
//   }
//
//   Widget buildVideoCompressedInfo() {
//     if (compressedVideoInfo == null) {
//       print('null');
//       return Container(
//         child: Text('NULL'),
//       );
//     }
//
//     final size = compressedVideoInfo!.filesize! / 1000;
//     print(size);
//
//     return Column(
//       children:[
//          Text('Compressed Video Size'),
//           Text('Reduced Size : ${size} KB'),]
//     );
//   }
//
//   Widget buildThumbnail() {
//     if (thumbnailBytes != null)
//       return Image.memory(thumbnailBytes!, height: 100);
//     else
//       return Text('NULL');
//   }
//
//   Widget buildVideoInfo() {
//     final size = videoSize! / 1000;
//     if (videoSize == null)
//       return Container(
//         child: Text('NULL'),
//       );
//     else
//       return Column(
//         children: [
//           Text('Originial Video Info'),
//           Text('Size: $size KB'),
//           RaisedButton(
//             onPressed: compressVideo,
//             child: Text('light compressed'),
//           ),
//           buildVideoCompressedInfo(),
//         ],
//       );
//   }
//
//   Widget buildContext() {
//     if (fileVideo == null) {
//       return RaisedButton(
//           child: Text('light compress'),
//           onPressed: () {
//             pickVideo();
//           });
//     } else {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           buildThumbnail(),
//           buildVideoInfo(),
//         ],
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             children: [
//               Container(
//                 child: Text('Light_compressor'),
//               ),
//               buildContext(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
