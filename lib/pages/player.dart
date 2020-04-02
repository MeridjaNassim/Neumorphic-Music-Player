import 'package:flutter/material.dart';
import 'package:neumorphic_music_player/widgets/controls.dart';
import 'package:neumorphic_music_player/widgets/image_placeholder.dart';
import 'package:neumorphic_music_player/widgets/player_slider.dart';
import 'package:neumorphic_music_player/widgets/text_placeholder.dart';
import '../widgets/neumorphic_app_bar.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
          child: Column(children: [
        NeumorphicAppBar(),
        SizedBox(
          height: 50,
        ),
        ImagePlaceHolder(
          image: AssetImage('images/sample2.jpg'),
        ),
        TitlePlaceholder(title: "Track Title", subTitle: "track subtitle"),
        PlayerSlider(),
        Controls()
      ])),
    );
  }
}
