import 'package:flutter/material.dart';
import 'package:flutter_star_wars/data/Character.dart';

class DetailScreen extends StatelessWidget {
  final Character characterData;

  const DetailScreen({Key key, this.characterData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("${characterData.name}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        color: Colors.black87,
        child: Table(
          children: _buildTable(),
        ),
      ),
    );
  }
  
  List<TableRow> _buildTable() {
    double leftRightSpacer = 30.0;
    double topSpacer = 15.0;
    return [
      TableRow(
        children: [
          Container(
            padding: EdgeInsets.only(left: leftRightSpacer, top: topSpacer),
            child: Text("Height",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: leftRightSpacer, top: topSpacer),
            child: Text("${characterData.height}",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.amber
              ),
            )
          )
        ]
      ),
      TableRow(
          children: [
            Container(
              padding: EdgeInsets.only(left: leftRightSpacer, top: topSpacer),
              child: Text("Gender",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              )
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: leftRightSpacer, top: topSpacer),
              child: Text("${characterData.gender}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.amber
                ),
              )
            )
          ]
      ),
      TableRow(
          children: [
            Container(
              padding: EdgeInsets.only(left: leftRightSpacer, top: topSpacer),
              child: Text("Mass",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              )
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: leftRightSpacer, top: topSpacer),
              child: Text("${characterData.mass}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.amber
                ),
              )
            )
          ]
      ),
      TableRow(
          children: [
            Container(
              padding: EdgeInsets.only(left: leftRightSpacer, top: topSpacer),
              child: Text("Hair Color",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              )
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: leftRightSpacer, top: topSpacer),
              child: Text("${characterData.hairColor}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.amber
                ),
              )
            )
          ]
      ),
      TableRow(
          children: [
            Container(
              padding: EdgeInsets.only(left: leftRightSpacer, top: topSpacer),
              child: Text("Skin Color",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              )
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: leftRightSpacer, top: topSpacer),
              child: Text("${characterData.skinColor}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.amber
                ),
              )
            )
          ]
      ),
      TableRow(
          children: [
            Container(
              padding: EdgeInsets.only(left: leftRightSpacer, top: topSpacer),
              child: Text("Eye Color",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              )
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: leftRightSpacer, top: topSpacer),
              child: Text("${characterData.eyeColor}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.amber
                ),
              )
            )
          ]
      ),
      TableRow(
          children: [
            Container(
              padding: EdgeInsets.only(left: leftRightSpacer, top: topSpacer),
              child: Text("Birth Year",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              )
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: leftRightSpacer, top: topSpacer),
              child: Text("${characterData.birthYear}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.amber
                ),
              )
            )
          ]
      ),
    ];
  }
}