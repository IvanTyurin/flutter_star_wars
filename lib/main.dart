import 'package:flutter/material.dart';
import 'package:flutter_star_wars/data/Character.dart';
import 'package:flutter_star_wars/data/NetworkService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NetworkService network = new NetworkService();
  List<Character> charactersList = [];

  void onDataRecieved(List<Character> list) {
    setState(() {
      if(list == null) {
        print("CHARACTERS NULL!");
      } else {
        charactersList = list;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    network.callback = (List<Character> data) {
      onDataRecieved(data);
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
              padding: EdgeInsets.all(2),
              itemCount: charactersList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 30,
                  child: Center(
                    child: Text('${charactersList[index].name}'),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          network.sendRequest();
        },
        child: Icon(Icons.update),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
