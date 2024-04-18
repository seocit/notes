import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: const NoteList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Add'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Title',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextField(
                      controller: _titleController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Description',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextField(
                      controller: _descriptionController,
                    )
                  ],
                ),
                actions: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Map<String, dynamic> notes = {};
                        notes['titles'] = _titleController.text;
                        notes['description'] = _descriptionController.text;

                        FirebaseFirestore.instance
                            .collection('notes')
                            .add(notes)
                            .whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Text('Save')),
                ],
              );
            },
          );
        },
        tooltip: 'Add Notes',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('notes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return ListView(
                padding: const EdgeInsets.only(bottom: 80),
                children: snapshot.data!.docs.map((document) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Card(
                      child: ListTile(
                        onTap: () {},
                        title: Text(document['titles']),
                        subtitle: Text(document['description']),
                      ),
                    ),
                  );
                }).toList(),
              );
          }
        });
  }
}
