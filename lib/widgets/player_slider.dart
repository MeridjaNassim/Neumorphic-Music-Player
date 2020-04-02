import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PlayerSlider extends StatefulWidget {
  PlayerSlider({Key key}) : super(key: key);

  @override
  _PlayerSliderState createState() => _PlayerSliderState();
}

class _PlayerSliderState extends State<PlayerSlider> {
  double value = 80;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: NeumorphicSlider(
              thumb: Neumorphic(
                style: NeumorphicStyle(
                  disableDepth: null,
                  shape: NeumorphicShape.concave,
                  color: Colors.white,
                ),
                boxShape: NeumorphicBoxShape.circle(),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor),
                  ),
                ),
              ),
              height: 10,
              style: SliderStyle(
                  depth: -50,
                  accent: Theme.of(context).accentColor.withAlpha(200),
                  variant: Theme.of(context).accentColor),
              min: 0,
              max: 100,
              value: value,
              onChanged: (value) => setState(() {
                this.value = value;
              }),
            )),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            "-3:10",
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
