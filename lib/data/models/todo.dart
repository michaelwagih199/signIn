import 'package:flutter/material.dart';
import 'package:hr/data/models/todo_entity.dart';

@immutable
class Todo {
  final bool complete;

  final String id;

  final String note;

  final String task;

  Todo(this.task, {this.complete = false, String note = '', required String id})
      : this.note = note,
        this.id = id;

  Todo copyWith(
      {required bool complete,
      required String id,
      required String note,
      required String task}) {
    return Todo(
      task,
      complete: complete,
      id: id,
      note: note,
    );
  }

  @override
  int get hashCode =>
      complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          complete == other.complete &&
          task == other.task &&
          note == other.note &&
          id == other.id;

  @override
  String toString() {
    return 'Todo { complete: $complete, task: $task, note: $note, id: $id }';
  }

  TodoEntity toEntity() {
    return TodoEntity(task, id, note, complete);
  }

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      entity.task,
      complete: entity.complete,
      note: entity.note,
      id: entity.id,
    );
  }
}
