import 'package:flutter/material.dart';
import 'package:flutter_star_wars/data/Character.dart';
import 'package:flutter_star_wars/data/NetworkService.dart';
import 'package:flutter_star_wars/views/DetailScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        backgroundColor: Colors.black87,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white70),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NetworkService network = new NetworkService();
  List<Character> charactersList = [];

  final TextEditingController _controller = new TextEditingController();
  String searchString = "";
  bool searchIsEmpty = false;

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
  void initState() {
    super.initState();
    network.callback = (List<Character> data) {
      onDataRecieved(data);
    };
    network.sendRequest();
  }

  Widget build(BuildContext context) {
    int count = 0;

    if(charactersList.length == 0) {
      count = 1;
      searchIsEmpty = true;
    } else {
      count = charactersList.length;
      searchIsEmpty = false;
    }

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
          child: Container(
            color: Colors.black87,
            child: ListView.separated(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              itemCount: count,
              itemBuilder: _buildListItem,
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                  child: Divider(
                    color: Colors.amber,
                  ),
                );
              },
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.update),
        backgroundColor: Colors.amber,
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(centerTitle: true,
        title: TextField(
          controller: _controller,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.black87,),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.black87),
          ),
          onChanged: (data) {
              searchProvider(data);
          })
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    String name = "No search results";
    if(!searchIsEmpty) {
      name = charactersList[index].name;
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return DetailScreen(characterData: charactersList[index]);
        }));
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text('$name'),
          )
      ),
    );
  }

  void searchProvider(String searchString) {
    network.search(searchString);
  }
}
