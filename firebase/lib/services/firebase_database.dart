import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabase {
  final _services = FirebaseFirestore.instance;

  getBrands() {
    return _services.collection('brands').snapshots();
  }
}
