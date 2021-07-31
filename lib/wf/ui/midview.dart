import 'package:forecast/wf/model/wfm.dart';
import 'package:forecast/wf//util/converticon.dart';
import 'package:forecast/wf/util/forecastutil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MidView extends StatelessWidget {
  final dynamic snapshot;
  MidView({this.snapshot});
  @override
  Widget build(BuildContext context) {

    var forecastList = snapshot['list'];
    var city = snapshot['city']['name'];    // var city = snapshot.data!.city.name;
    var country = snapshot['city']['country'];    // var city = snapshot.data!.city.name;
    var formattedDate =
    new DateTime.fromMillisecondsSinceEpoch(forecastList[0]['dt'] * 1000);
    var forecast = forecastList[0];

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "$city, $country",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87),
            ),
            Text(
              "${Util.getFormattedDate(formattedDate)}",
              style: TextStyle(fontSize: 15),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(
                  weatherDescription: forecastList[0]['weather'][0]['main'],
                  color: Colors.pinkAccent,
                  size: 198),
            ),
            //Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.pinkAccent,),
            //Icon(Icons.wb_sunny, size: 195,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${forecast['temp']['day'].toStringAsFixed(0)}°F",
                    style: TextStyle(fontSize: 34),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${forecast['weather'][0]['description'].toUpperCase()}"),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${forecast['speed'].toStringAsFixed(1)} mi/h"),
                        Icon(
                          FontAwesomeIcons.wind,
                          size: 20,
                          color: Colors.brown,
                        )
                        //Icon(Icons.arrow_forward, size: 20, color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${forecast['humidity'].toStringAsFixed(0)} %"),
                        Icon(
                          FontAwesomeIcons.solidGrinBeamSweat,
                          size: 20,
                          color: Colors.brown,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${forecast['temp']['max'].toStringAsFixed(0)}°F "),
                        Icon(
                          FontAwesomeIcons.temperatureHigh,
                          size: 20,
                          color: Colors.brown,
                        )
                        //Icon(Icons.wb_sunny, size: 20, color: Colors.brown,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
