import 'package:flutter/material.dart';

class TitlePlaceholder extends StatelessWidget {
  final String title;
  final String subTitle;

  const TitlePlaceholder({Key key, this.title, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(children: [
        Text(this.title,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontSize: 30, fontWeight: FontWeight.w500)),
        SizedBox(height: 10),
        Text(this.subTitle,
            style: Theme.of(context)
                .textTheme
                .subtitle
                .copyWith(fontSize: 18, fontWeight: FontWeight.w400))
      ]),
    );
  }
}
