import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicAppBar extends StatelessWidget {
  const NeumorphicAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ControlButton(
                icon: Theme.of(context).platform == TargetPlatform.android
                    ? Icons.arrow_back
                    : Icons.arrow_back_ios,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Listen now",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline),
              ),
              ControlButton(
                icon: Icons.library_music,
                onTap: () {
                  print('do something');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final String tooltip;
  final double depth;
  final neumorphismTheme;
  final Color color;
  final Color iconColor;
  final NeumorphicShape shape;
  const ControlButton({
    @required this.onTap,
    @required this.icon,
    this.depth,
    this.neumorphismTheme,
    this.iconColor,
    this.shape,
    this.color,
    this.tooltip,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Neumorphic(
        style: NeumorphicStyle(
            color: this.color ?? Theme.of(context).primaryColor,
            depth: this.depth ?? 3,
            intensity: 0.5,
            surfaceIntensity: 0.4,
            shape: shape ?? NeumorphicShape.convex,
            lightSource: LightSource.topLeft),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: IconTheme(
              data: this.iconColor == null
                  ? Theme.of(context).iconTheme
                  : Theme.of(context).iconTheme.copyWith(color: this.iconColor),
              child: Icon(this.icon)),
        ),
        boxShape: NeumorphicBoxShape.circle(),
      ),
    );
  }
}
