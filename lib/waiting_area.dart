import 'dart:async';

import 'package:Asclepius/diagnostic_reminder.dart';
import 'package:flutter/material.dart';

class WaitingArea extends StatefulWidget {
  final String doctorChannelId;

  WaitingArea(this.doctorChannelId, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WaitingAreaState();
}

class WaitingAreaState extends State<WaitingArea> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 30,
                  child: Text(
                    '医生信息',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  height: 160,
                  child: Placeholder(),
                ),
                Divider(),
                SizedBox(
                  height: 30,
                  child: Text(
                    '问诊队列',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  height: 160,
                  child: Placeholder(),
                ),
                SizedBox(height: 50),
                MaterialButton(
                  color: Colors.amber,
                  child: Text(
                    '挂    号',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () {
                    Future.delayed(Duration(seconds: 5), () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              DiagnosticReminder(widget.doctorChannelId)));
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
