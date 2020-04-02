import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic_music_player/pages/player.dart';
import 'package:neumorphic_music_player/widgets/image_placeholder.dart';
import '../widgets/neumorphic_app_bar.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ControlButton(onTap: () {}, icon: Icons.search),
                    ControlButton(onTap: () {}, icon: Icons.apps)
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Collections",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade400)),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 3.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  reverse: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Album(
                        image: AssetImage('images/cosmos.jpg'),
                        title: "title1",
                        numberOfTracks: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Album(
                        image: AssetImage('images/sample.jpg'),
                        title: "title1",
                        numberOfTracks: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Album(
                        image: AssetImage('images/sample2.jpg'),
                        title: "title1",
                        numberOfTracks: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Album(
                        image: AssetImage('images/edsheran.jpg'),
                        title: "title1",
                        numberOfTracks: 200,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Recommendations",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade400)),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  ListView(children: [
                    TrackTile(artist: "Ed Sheran", title: "Shape of you"),
                    TrackTile(artist: "Cosmos", title: "Space"),
                    TrackTile(artist: "Sample1", title: "Title1"),
                    TrackTile(artist: "Sample2", title: "Title2"),
                    TrackTile(
                      artist: "Ed Sheran",
                      title: "Shape of you",
                    ),
                  ]),
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Player(
                      title: "Shape of you",
                      artist: "Ed sheran",
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x22000000),
                              blurRadius: 30,
                              offset: Offset(0, -3))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)),
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            )
          ])),
    );
  }
}

class Album extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final int numberOfTracks;

  const Album({Key key, this.image, this.numberOfTracks, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ImagePlaceHolder(
          image: this.image,
          height: MediaQuery.of(context).size.height / 5,
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(this.title,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text("${numberOfTracks.toString()} songs",
              style: Theme.of(context).textTheme.subtitle),
        )
      ],
    );
  }
}

class TrackTile extends StatelessWidget {
  const TrackTile(
      {Key key, this.artist, this.title, this.displayDivider = false})
      : super(key: key);
  final String title;
  final String artist;
  final bool displayDivider;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.title,
                          style: Theme.of(context).textTheme.title.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(this.artist,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.subtitle),
                    ]),
              ),
              ControlButton(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => PlayerPage()));
                },
                icon: Icons.play_arrow,
                color: Theme.of(context).primaryColor,
                iconColor: Theme.of(context).accentColor,
              )
            ],
          ),
          SizedBox(height: 10),
          () {
            return !displayDivider
                ? Container()
                : Divider(
                    thickness: 0,
                    color: Colors.grey.shade300,
                  );
          }()
        ],
      ),
    );
  }
}

class Player extends StatelessWidget {
  final String artist;
  final String title;
  const Player({Key key, this.title, this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Stack(alignment: AlignmentDirectional.center, children: [
              SizedBox(
                  width: 60,
                  child: ControlButton(
                    depth: -10,
                    shape: NeumorphicShape.concave,
                    color: Theme.of(context).accentColor,
                    iconColor: Colors.white,
                    onTap: () {},
                    icon: Icons.pause,
                  )),
              Center(
                child: SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      value: 0.65,
                      strokeWidth: 2,
                    )),
              ),
            ]),
          ),
          Column(
            children: <Widget>[
              Text(this.title,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(this.artist,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ControlButton(onTap: () {}, icon: Icons.skip_previous),
            SizedBox(width: 5),
            ControlButton(onTap: () {}, icon: Icons.skip_next)
          ]),
        ],
      ),
    );
  }
}
