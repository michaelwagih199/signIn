import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/data/models/todo.dart';
import 'package:hr/data/models/todo_entity.dart';
import 'package:hr/data/models/todos_repository.dart';

class FirebaseTodosRepository implements TodosRepository {
  // final todoCollection = Firestore.instance.collection('todos');

  CollectionReference todoCollection =
      FirebaseFirestore.instance.collection('products');

  @override
  Future<void> addNewTodo(Todo todo) {
    return todoCollection.add(todo.toEntity().toDocument());
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    return todoCollection.doc(todo.id).delete();
  }

  @override
  Stream<List<Todo>> todos() {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Todo.fromEntity(TodoEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateTodo(Todo update) {
    return todoCollection.doc(update.id).update(update.toEntity().toDocument());
  }
  
}
