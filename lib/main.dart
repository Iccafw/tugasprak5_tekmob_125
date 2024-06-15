import 'package:flutter/material.dart';
import 'package:modul_3/providers/note_provider.dart';
import 'package:modul_3/screens/add_note_page.dart';
import 'package:modul_3/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => const HomePage(),
          '/addNote': (BuildContext context) => const AddNotePage(),
        },
      ),
    );
  }
}
