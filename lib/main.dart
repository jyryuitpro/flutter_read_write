import 'package:flutter/material.dart';
import 'package:flutter_read_write/file_utils.dart';

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
      ),
      home: FileOperationsScreenState(),
    );
  }
}

class FileOperationsScreenState extends StatefulWidget {
  const FileOperationsScreenState({Key? key}) : super(key: key);

  @override
  _FileOperationsScreenStateState createState() =>
      _FileOperationsScreenStateState();
}

class _FileOperationsScreenStateState extends State<FileOperationsScreenState> {
  String fileContents = 'No Data';

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Operations'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: myController,
          ),
          RaisedButton(
            child: Text('Save To File'),
            onPressed: () {
              FileUtils.saveToFile(myController.text);
            },
          ),
          RaisedButton(
            child: Text('Read From File'),
            onPressed: () {
              FileUtils.readFromFile().then((contents) {
                setState(() {
                  fileContents = contents;
                });
              });
            },
          ),
          Text(fileContents),
        ],
      ),
    );
  }
}
