import 'package:Asclepius/waiting_area.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Doctor_A',
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => WaitingArea('001'))),
          )
        ],
      )),
    );
  }
}
