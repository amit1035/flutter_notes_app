import 'package:hive/hive.dart';
import '../models/note_model.dart';

class NoteDatabase {
  static const String boxName = "notesBox";

  Future<void> addNote(NoteModel note) async {
    final box = await Hive.openBox<NoteModel>(boxName);
    await box.add(note);
  }

  Future<List<NoteModel>> getNotes() async {
    final box = await Hive.openBox<NoteModel>(boxName);
    return box.values.toList();
  }

  Future<void> deleteNote(int index) async {
    final box = await Hive.openBox<NoteModel>(boxName);
    await box.deleteAt(index);
  }
}
