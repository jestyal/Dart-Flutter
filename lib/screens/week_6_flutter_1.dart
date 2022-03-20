import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IdeasPage extends StatefulWidget {
  const IdeasPage({Key? key}) : super(key: key);

  @override
  State<IdeasPage> createState() => _IdeasPageState();
}

class _IdeasPageState extends State<IdeasPage> {
  final myController = TextEditingController();

  final Set<String> noteList = {};
  String newNote = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notes"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                    labelText: "Enter your note",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String str) {
                    setState(() {
                      newNote = str;
                    });
                  }),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                if (noteList.contains(newNote)) {
                  final snackBar = SnackBar(
                    content: const Text("Note already exists"),
                    backgroundColor: Colors.redAccent,
                    action: SnackBarAction(
                      label: 'Close',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  setState(() {
                    noteList.add(newNote);
                    myController.clear();
                  });
                }
              },
              child: const Text('Enabled'),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Notes:",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: noteList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      tileColor: Colors.lightBlueAccent,
                      title: Text(
                        noteList.elementAt(index),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
