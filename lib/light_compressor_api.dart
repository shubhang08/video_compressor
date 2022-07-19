// import 'package:light_compressor/light_compressor.dart';
// import 'package:video_compress/video_compress.dart';
//
// class LightCompressApi {
//
//
//   static Future<MediaInfo?> compreVideo(fileVideo) async {
//     //final LightCompressor _lightCompressor = LightCompressor();
//
//     try {
//       final LightCompressor _lightCompressor = LightCompressor();
//
//       final reponse = await _lightCompressor.compressVideo(
//           path: fileVideo!.path,
//           destinationPath: fileVideo!.path,
//         videoQuality: VideoQuality.very_low,
//           isMinBitrateCheckEnabled: true,
//           frameRate: 24
//
//       );
//     }
//     catch (e) {
//       LightCompressor.cancelCompression();
//     }
//   }
// }