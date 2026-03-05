import 'package:flutter/material.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final TextEditingController _controller = TextEditingController();

  List<String> notes = [];

  void addNote() {
    if (_controller.text.isEmpty) return;

    setState(() {
      notes.add(_controller.text);
      _controller.clear();
    });
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Tulis catatan",
              ),
            ),
          ),

          ElevatedButton(
            onPressed: addNote,
            child: const Text("Tambah Note"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteNote(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}