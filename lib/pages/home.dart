import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   //WorldCountry data = WorldCountry("", "", "");
  Map data = {};
  @override
  Widget build(BuildContext context) {
     data = data.isNotEmpty ? data: ModalRoute.of(context)?.settings.arguments as Map;
    print("data in home: ${data['location']}");
    String bgImage = data['isDayTime'] ? "day.jpg" : "night.jpg";
    Color textcolor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/${bgImage}"),
                fit: BoxFit.cover
            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 150.0, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context,'/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result["location"],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag']
                    };
                  });
                },
                icon: Icon(
                    Icons.edit_location,
                    color: textcolor
                ),
                label: Text(
                  'Edit location',
                  style: TextStyle(color: textcolor),
                ),

              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: textcolor
                    ),
                  ),

                ],
              ),
              SizedBox(height: 18.0,),
              Text(
                data['time'],
                style: TextStyle(
                    fontSize: 66.0,
                    color: textcolor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
