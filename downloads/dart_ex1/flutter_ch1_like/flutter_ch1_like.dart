import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new LikesWidget(),
    ),
  );
}

class LikesWidget extends StatefulWidget {
  @override
  LikesWidgetState createState() => LikesWidgetState();
}

class LikesWidgetState extends State<LikesWidget> {
  int likeCount = 0;
  void like() {
    setState(() {
      likeCount += 1;
    });
  }

  @override
  Widget build(BuildContext inContext) {
    return Row(children: [
      RaisedButton(onPressed: like, child: Text('按了 $likeCount 次'))
    ]);
  }
}
