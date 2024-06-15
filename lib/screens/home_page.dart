import 'package:flutter/material.dart';
import 'package:modul_3/providers/note_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteState = context.watch<NoteProvider>();
    final noteList = noteState.noteList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Note App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNote');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: noteList.isEmpty
            ? const Center(
                child: Text("No Notes Added Yet!"),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  final note = noteList[index];
                  return NoteCardWidget(
                    title: note.title,
                    description: note.description,
                    note: note.note,
                  );
                },
              ),
      ),
    );
  }
}

class NoteCardWidget extends StatelessWidget {
  final String title;
  final String? description;
  final String note;

  const NoteCardWidget({
    required this.title,
    required this.note,
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle.headline6!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (description != null) ...[
            const SizedBox(height: 8),
            Text(
              description!,
              style: textStyle.bodyText2!.copyWith(
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              note,
              style: textStyle.bodyText1,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
