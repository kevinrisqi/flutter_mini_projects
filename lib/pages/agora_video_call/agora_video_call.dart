import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgoraVideoCall extends StatelessWidget {
  const AgoraVideoCall({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Agora Video Call'),
          ),
          body: Stack(
            children: [
              // Center(
              //   child: _remoteVideo(),
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: SizedBox(
              //     width: 100,
              //     height: 150,
              //     child: Center(
              //       child: _localUserJoined
              //           ? AgoraVideoView(
              //               controller: VideoViewController(
              //                 rtcEngine: _engine,
              //                 canvas: const VideoCanvas(uid: 0),
              //               ),
              //             )
              //           : const CircularProgressIndicator(),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      }
    );
  }
}
