import 'package:flutter/material.dart';
import 'package:sport_rental_app/NavBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Sports IIITN'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 130,
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 150.0,
              height: 100.0,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Respond to button press
                },
                icon: Icon(Icons.add, size: 18),
                label: Text("Available Item"),
              ),
            ),
           SizedBox(height: 10),
            SizedBox(
              width: 150.0,
              height: 100.0,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Respond to button press
                },
                icon: Icon(Icons.add, size: 18),
                label: Text("Request Item"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
