import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.white),
    );
  }
}

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  String input = "";
  List note = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    'Add Note',
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                  content: TextField(
                    decoration: InputDecoration(hintText: "Write here"),
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          note.add(input);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'ADD',
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    )
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.deepOrange,
          size: 35,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: note.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(note[index]),
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      title: Text(
                        note[index],
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            note.removeAt(index);
                          });
                        },
                        icon: Icon(
                          Icons.delete_forever_rounded,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ));
            }),
      ),
    ));
  }
}
