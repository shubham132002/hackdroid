import 'package:flutter/material.dart';
import 'package:sport_rental_app/NavBar.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class availableitem extends StatefulWidget {
  const availableitem({Key? key}) : super(key: key);

  @override
  _availableitem createState() => _availableitem();
}

class _availableitem extends State<availableitem> {
  List _item = [];
  Future getdata() async {
    List data = [];
    http.Response response;
    String api = "http://10.0.2.2/get_items/"; //api url
    response = await http.get(Uri.parse(api));
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      // print('response from 200 $responseData');
      if (responseData.isNotEmpty) {
        for (var i = 0; i < responseData.length; i++) {
          // print(responseData[i]);
          data.add(responseData[i]);
        }
        print(data);
        setState(() {
          _item.addAll(data);
          // print("data of designation $_directorate");
          //  print(_building);
          // for (var i = 0; i < _item.length; i++) {
          //   bul.add(_item[i]);
          // }
          // print(bul);
          print(_item);
        });
      } else {
        // print('response from 400 $responseData');

      }
    }
  }

  List bul = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await getdata();
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Sports IIITN'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: ListView(
        padding: EdgeInsets.only(top: 30),
        children: [
          ListTile(
            title: Text('Primary text'),
            leading: Icon(Icons.sports),
            trailing: Text('Metadata'),
          ),
          Divider(),
          Divider(),
          ListTile(
            title: Text('Primary text'),
            leading: Icon(Icons.sports),
            trailing: Text('Metadata'),
          ),
          Divider(),
          Divider(),
          ListTile(
            title: Text('Primary text'),
            leading: Icon(Icons.sports),
            trailing: Text('Metadata'),
          ),
          Divider(),
          Divider(),
          ListTile(
            title: Text('Primary text'),
            leading: Icon(Icons.sports),
            trailing: Text('Metadata'),
          ),
          Divider(),
          Divider(),
          ListTile(
            title: Text('Primary text'),
            leading: Icon(Icons.sports),
            trailing: Text('Metadata'),
          ),
          Divider(),
          Divider(),
          ListTile(
            title: Text('Primary text'),
            leading: Icon(Icons.sports),
            trailing: Text('Metadata'),
          ),
          Divider(),
        ],
      )),
    );
  }
}
