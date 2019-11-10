import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'test1.dart';
import 'data_models.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data;
  LessonData abcd;
  final JsonEncoder jsonEncoder = new JsonEncoder.withIndent('    ');
  @override
  void initState() {
    data = "";
    abcd = LessonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: Column(
            children: <Widget>[
              (data == "") ? Text("Welcome") : Text("JSON Saved Temporarily"),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              RaisedButton(
                child: (data == "") ? Text("Get Data") : Text("Load Page"),
                onPressed: () {
                  fetchData();
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              (data != "")
                  ? DataTable(
                      columns: <DataColumn>[
                        DataColumn(label: Text("Key")),
                        DataColumn(label: Text("Value"))
                      ],
                      rows: _buildRows(),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  List<DataRow> _buildRows() {
    List<DataRow> dataValues = [];
    if (abcd.title != "") {
      dataValues.add(DataRow(cells: <DataCell>[
        DataCell(Text("title")),
        DataCell(Text(abcd.title))
      ]));
    }
    if (abcd.introText != "") {
      dataValues.add(DataRow(cells: <DataCell>[
        DataCell(Text("introText")),
        DataCell(Text(abcd.introText))
      ]));
    }
    if (abcd.studyText != "") {
      dataValues.add(DataRow(cells: <DataCell>[
        DataCell(Text("studyText")),
        DataCell(Text(abcd.studyText))
      ]));
    }
    return dataValues;
  }

  void fetchData() async {
    if (data == "") {
      final response =
          await http.get("https://1ashutosh.pythonanywhere.com/api/lesson/1");
      if (response.statusCode == 200) {
        String body = response.body;
        setState(() {
          data = body;
          abcd = LessonData.fromJSON(json.decode(body));
        });
      } else {
        setState(() {
          data = "Unable to connect!";
        });
        throw Exception("Unable to load!");
      }
    }
    else {
      abcd = LessonData.fromJSON(json.decode(data));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Test1Page(test1data: abcd.test1[0],)));
    }
  }
}
