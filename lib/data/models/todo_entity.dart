import 'package:cloud_firestore/cloud_firestore.dart';

class TodoEntity  {
  
  final bool complete;

  final String id;

  final String note;

  final String task;

  TodoEntity(this.task, this.id, this.note, this.complete);

  Map<String, Object> toJson() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'TodoEntity { complete: $complete, task: $task, note: $note, id: $id }';
  }

  static TodoEntity fromJson(Map<String, Object> json) {
    return TodoEntity(
      json['task'] as String,
      json['id'] as String,
      json['note'] as String,
      json['complete'] as bool,
    );
  }

 static TodoEntity fromSnapshot(DocumentSnapshot snap) {
    return TodoEntity(
      snap['task'],
      snap.id,
      snap['note'],
      snap['complete'],
    );
  }


  Map<String, Object> toDocument() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
    };
  }


}
