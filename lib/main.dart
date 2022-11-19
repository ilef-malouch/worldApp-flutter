import 'package:flutter/material.dart';
import 'Quote.dart';
import "quote-card.dart";
import "pages/home.dart";
import "pages/loading.dart";
import "pages/choose_location.dart";

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation()
  },
));

class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

  int ninjaLevel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Ninja ID Card"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            ninjaLevel ++;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800]
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/woman.png"),
                radius: 50.0,
              ),
            ),
            Divider(
              height: 90.0,
              color: Colors.grey[800],
            ),
            Text(
              "NAME",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0
              ),
            ),
            SizedBox(height:10.0),
            Text(
              "Ilef Malouche",
              style: TextStyle(
                color: Colors.pinkAccent[100],
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
                fontSize: 28.0
              ),
            ),
            SizedBox(height:30.0),
            Text(
              "CURRENT NINJA LEVEL",
              style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0
              ),
            ),
            SizedBox(height:10.0),
            Text(
              "$ninjaLevel",
              style: TextStyle(
                  color: Colors.pinkAccent[100],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  "ilef@gmail.com",
                  style: TextStyle(
                    color: Colors.grey[400],
                    letterSpacing: 1.0,
                    fontSize: 18.0
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class QuotesList extends StatefulWidget {
  const QuotesList({Key? key}) : super(key: key);

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {

  List<Quote> quotes = [
    Quote(text:"When you reach the end of your rope, tie a knot in it and hang on.",author:"Franklin D. Roosevelt"),
    Quote(text:"Don't judge each day by the harvest you reap but by the seeds that you plant.",author:"Robert Louis Stevenson"),
    Quote(text:"The future belongs to those who believe in the beauty of their dreams.",author:"Eleanor Roosevelt")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awsome Quotes"),
        backgroundColor: Colors.teal[300],
        centerTitle: true,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
            quote: quote,
            delete: () {
              setState(() {
                quotes.remove(quote);
              });
        })).toList(),
      ),
    );
  }
}



