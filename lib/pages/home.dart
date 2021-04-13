import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    Color textColor = data['isDayTime'] ? Colors.black87 : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      "time": result["time"],
                      "location": result["location"],
                      "isDayTime": result["isDayTime"],
                      "flag": result["flag"],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: textColor,
                ),
                label: Text(
                  'Edit location',
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
