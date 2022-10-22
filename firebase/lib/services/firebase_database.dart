import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatabase {
  final _services = FirebaseFirestore.instance;
  final _fauth = FirebaseAuth.instance;

  getBrands() {
    return _services.collection('brands').snapshots();
  }

  getTodoFoUser() {
    return _services
        .collection('todo')
        .doc(_fauth.currentUser!.uid)
        .collection('tasks')
        .snapshots();
  }

  completeTask(bool isCompleted, String docId) {
    return _services
        .collection('todo')
        .doc(_fauth.currentUser!.uid)
        .collection('tasks')
        .doc(docId)
        .update({
      'isCompleted': isCompleted,
    });
  }

  addTasks(String title) {
    return _services
        .collection('todo')
        .doc(_fauth.currentUser!.uid)
        .collection('tasks')
        .doc()
        .set({
      'title': title,
      'isCompleted': false,
    });
  }
}
