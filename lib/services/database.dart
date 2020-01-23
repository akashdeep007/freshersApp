import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hogwarts/models/Student.dart';

class DatabaseService {
  final String uid;
  final CollectionReference studentCollection =
      Firestore.instance.collection('students');
  DatabaseService({this.uid});

  Future updateUserData(String name, String email, String interests) async {
    return await studentCollection.document(uid).setData({
      'Name': name,
      'Email': email,
      'Interest': interests,
    });
  }

  //List of Students
  List<Student> _StudentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Student(
          name: doc.data['Name'] ?? "",
          email: doc.data['Email'] ?? "",
          interests: doc.data['Interest'] ?? "");
    }).toList();
  }

  Stream<List<Student>> get students {
    return studentCollection.snapshots().map(_StudentListFromSnapshot);
  }
}
