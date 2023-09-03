import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, rootBundle;

import 'package:csv/csv.dart';
import 'view_file.dart';
import 'pdfview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      title: 'EIC Quranic Shell App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final rawData =
        await rootBundle.loadString("assets/surahs/surah_names.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);

    setState(() {
      _data = listData;
    });
  }

  @override
  void initState() {
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EIC Quranic App"),
      ),
      // Display the contents from the CSV file
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.all(3),
            color: (index % 2) == 0
                ? Color.fromARGB(255, 223, 226, 224)
                : Colors.white,
            //color: index == 0 ? Colors.amber : Colors.white,
            child: ListTile(
              //leading: Text(_data[index][1].toString()),
              title: Text(_data[index][1]),
              subtitle: Text(_data[index][2].toString()),
              //trailing: Text(_data[index][2].toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewFile(
                      fileName: _data[index][0],
                      surahName: _data[index][1],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),

      // floatingActionButton: FloatingActionButton(
      //     onPressed: _loadCSV, child: const Icon(Icons.add)),
    );
  }
}
