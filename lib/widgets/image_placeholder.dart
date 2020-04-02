import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ImagePlaceHolder extends StatelessWidget {
  final ImageProvider image;
  final double width;
  final double height;
  const ImagePlaceHolder(
      {Key key, this.image, @required this.height, @required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height ?? MediaQuery.of(context).size.height / 2.5,
      width: this.width ?? null,
      child: Neumorphic(
          boxShape: NeumorphicBoxShape.roundRect(
              borderRadius: BorderRadius.circular(50)),
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              color: Theme.of(context).primaryColor,
              lightSource: LightSource.topLeft,
              depth: 6,
              intensity: 0.2,
              surfaceIntensity: 0.2),
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                image: this.image,
              ),
            ),
          )),
    );
  }
}
