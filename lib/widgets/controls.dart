import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic_music_player/widgets/neumorphic_app_bar.dart';

class Controls extends StatefulWidget {
  const Controls({Key key}) : super(key: key);
  @override
  _ControlsState createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  bool play = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ControlButton(
              onTap: () {
                print('rewind');
              },
              icon: Icons.fast_rewind),
          ControlButton(
              depth: -50,
              color: Theme.of(context).accentColor,
              iconColor: Colors.white,
              onTap: () {
                setState(() {
                  if (play)
                    play = false;
                  else
                    play = true;
                });
              },
              icon: play ? Icons.play_arrow : Icons.pause),
          ControlButton(
              onTap: () {
                print('forward');
              },
              icon: Icons.fast_forward)
        ],
      ),
    );
  }
}
