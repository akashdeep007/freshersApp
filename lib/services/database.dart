import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final CollectionReference dataCollection =
      Firestore.instance.collection('students');
  DatabaseService({this.uid});

  Future updateUserData(String name, String email, String interests) async {
    return await dataCollection.document(uid).setData({
      'Name': name,
      'Email': email,
      'Interest': interests,
    });
  }
}
