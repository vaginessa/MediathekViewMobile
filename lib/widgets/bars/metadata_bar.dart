import 'package:flutter/material.dart';
import 'package:flutter_ws/util/timestamp_calculator.dart';
import 'package:flutter_ws/util/text_styles.dart';
import 'package:logging/logging.dart';

class MetadataBar extends StatelessWidget {
  final Logger logger = new Logger('MetadataBar');

  var videoDuration;
  final int videoTimestamp;
  ThemeData theme;

  MetadataBar(this.videoDuration, this.videoTimestamp);

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return new Container(
      constraints: BoxConstraints.loose(Size.fromHeight(20.0)),
      padding: new EdgeInsets.only(left: 40.0, right: 5.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: _getRow(
                  value: Calculator.calculateDuration(videoDuration),
                  image: 'assets/img/ic_distance.png')),
          new Expanded(
              child: _getRow(
                  value: Calculator.calculateTimestamp(videoTimestamp),
                  image: 'assets/img/ic_distance.png'))
        ],
      ),
    );
  }

  Widget _getRow({String value, String image}) {
    return new Row(children: <Widget>[
      new Image.asset(image, height: 12.0),
      new Container(width: 8.0),
      new Text(value, style: videoMetadataTextStyle),
    ]);
  }
}
