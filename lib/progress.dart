import 'package:flutter/material.dart';
import 'package:video_compress/video_compress.dart';


class ProgressDialogWidget extends StatefulWidget {
  const ProgressDialogWidget({Key? key}) : super(key: key);

  @override
  State<ProgressDialogWidget> createState() => _ProgressDialogWidgetState();
}

class _ProgressDialogWidgetState extends State<ProgressDialogWidget> {
  late Subscription subscription;
  double? progress;

  @override
  void initState(){
    super.initState();
    subscription=VideoCompress.compressProgress$.subscribe((progress)=> setState(()=>this.progress=progress));
  }

  @override
  void dispose() {
    VideoCompress.cancelCompression();
    subscription.unsubscribe;
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final value=progress ==null? progress:progress!/100;

    return Padding(padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('COmpressing Video...'),
          SizedBox(height: 20),
          LinearProgressIndicator(value:value,minHeight: 12,),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: ()=> VideoCompress.cancelCompression(), child: Text('Cancel')),

        ],
      ),



    );
  }
}
