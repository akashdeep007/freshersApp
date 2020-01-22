import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference dataCollection =
      Firestore.instance.collection('students');
}
