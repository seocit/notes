import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteService {
  final CollectionReference _database =
      FirebaseFirestore.instance.collection('note_list');

  Stream<Map<String, String>> getNoteList() {
    return _database.snapshots().map((querySnapshot) {
      final Map<String, String> items = {};

      querySnapshot.docs.map((docSnapshot) {
        final data = docSnapshot.data() as Map<String, String>;
        if (data.containsKey('title')) {
          Map<dynamic, dynamic> values = data as Map<dynamic, dynamic>;
          values.forEach((key, value) {
            items[key] = value['title'] as String;
          });
        }
      });
      return items;
    });
  }
}
