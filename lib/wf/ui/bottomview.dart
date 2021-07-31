import 'package:forecast/wf/model/wfm.dart';
import 'package:flutter/material.dart';

import 'package:forecast/wf/ui/forecastcard.dart';

//Better way of doing business!
class BottomView extends StatelessWidget {
  final dynamic snapshot;
  BottomView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "7-Day Weather Forecast".toUpperCase(),
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: snapshot['list'].length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 160,
                  child: forecastCard(snapshot, index),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff9661C3), Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                ),
              )),
        )
      ],
    );
  }
}

