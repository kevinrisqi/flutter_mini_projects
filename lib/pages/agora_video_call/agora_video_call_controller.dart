import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_mini_projects/widgets/custom_snackbar.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class AgoraVideoCallController extends GetxController {
  static const appId = "<-- Insert App Id -->";
  static const token = "<-- Insert Token -->";
  static const channel = "<-- Insert Channel Name -->";
  int uid = 0; // uid of the local user

  int? remoteUid; // uid of the remote user
  bool _isJoined = false; // Indicates if the local user has joined the channel
  late RtcEngine _engine; // Agora engine instance
  bool localUserJoined = false;

  showMessage(String message) {
    customSnackBar(message);
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          log("local user ${connection.localUid} joined");

          localUserJoined = true;
          update();
        },
        onUserJoined: (RtcConnection connection, int remoteId, int elapsed) {
          log("remote user $remoteUid joined");

          remoteUid = remoteId;
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          log("remote user $remoteUid left channel");

          remoteUid = 0;
          update();
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          log('[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: token,
      channelId: channel,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  void onInit() {
    log('Agora Video Call Init');
    initAgora();
    super.onInit();
  }
}
