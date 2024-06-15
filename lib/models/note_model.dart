import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class NoteModel extends Equatable {
  final String id;
  final String title;
  final String? description;
  final String note;

  NoteModel({
    required this.title,
    required this.note,
    this.description,
  }) : id = uuid.v4();

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        note,
      ];
}
