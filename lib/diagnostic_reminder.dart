import 'package:Asclepius/diagnosis_room.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class DiagnosticReminder extends StatelessWidget {
  final String doctorChannelId;

  DiagnosticReminder(this.doctorChannelId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Opacity(
              child: Container(
                color: Colors.cyan,
                alignment: Alignment.center,
              ),
              opacity: 0.3,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Text(
                    'Doctor-A 呼叫 ……',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )
                ],
              ),
            ),
            _toolbar(context),
          ],
        ),
      ),
    );
  }

  Widget _toolbar(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Icon(Icons.phone_missed, color: Colors.white, size: 36.0),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.red,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (_) => DiagnosisRoom(doctorChannelId))),
            child: Icon(Icons.phone, color: Colors.white, size: 36.0),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.green,
            padding: const EdgeInsets.all(12.0),
          ),
        ],
      ),
    );
  }

  Future<void> onJoin(BuildContext context) async {
    await _handleCameraAndMic();
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiagnosisRoom(doctorChannelId),
      ),
    );
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
