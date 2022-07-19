


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

class VideoCompressApi{


  static Future<MediaInfo?> compreVideo( files) async {

    try{
      await VideoCompress.setLogLevel(0);
      return VideoCompress.compressVideo(
          files.path,
          quality: VideoQuality.LowQuality,
          includeAudio:true);
    }
    catch(e) {
      VideoCompress.cancelCompression();
    } }
}