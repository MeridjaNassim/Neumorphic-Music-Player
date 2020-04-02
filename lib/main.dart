import 'package:flutter/material.dart';
import 'package:neumorphic_music_player/pages/player.dart';
import 'package:neumorphic_music_player/pages/playlist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic Music Player',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
          primaryColor: Color(0xFF292929),
          accentColor: Color(0xFFE54A35),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            caption: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white38,
            ),
            title: TextStyle(
                letterSpacing: 1.5,
                color: Colors.white54,
                fontSize: 24,
                fontWeight: FontWeight.w500),
            subtitle: TextStyle(
                color: Colors.white38,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            headline: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
          )),
      theme: ThemeData(
          primaryColor: Color(0xFFEFF0F3),
          accentColor: Color(0xFFE54A35),
          iconTheme: IconThemeData(
            color: Colors.grey.shade500,
          ),
          textTheme: TextTheme(
            caption: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
            ),
            title: TextStyle(
                letterSpacing: 1.5,
                color: Colors.black54,
                fontSize: 24,
                fontWeight: FontWeight.w500),
            subtitle: TextStyle(
                color: Colors.black38,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            headline: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 22,
                fontWeight: FontWeight.w700),
          )),
      home: PlaylistPage(),
    );
  }
}
