import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hogwarts/models/Event.dart';
import 'package:hogwarts/models/Student.dart';
import 'package:hogwarts/models/user.dart';

class DatabaseService {
  final String uid;
  final CollectionReference studentCollection =
      Firestore.instance.collection('students');
  DatabaseService({this.uid});
  final CollectionReference eventCollection =
      Firestore.instance.collection('events');

  Future updateUserData(String name, String email, String interests) async {
    return await studentCollection.document(uid).setData({
      'Name': name,
      'Email': email,
      'Interest': interests,
    });
  }

  //List of Students
  List<Student> _studentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Student(
          name: doc.data['Name'] ?? "",
          email: doc.data['Email'] ?? "",
          interests: doc.data['Interest'] ?? "");
    }).toList();
  }

  Stream<List<Student>> get students {
    return studentCollection.snapshots().map(_studentListFromSnapshot);
  }

  //userdata from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['Name'],
        email: snapshot.data['Email'],
        interest: snapshot.data['Interest']);
  }

  //get user doc
  Stream<UserData> get userData {
    return studentCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  //event notifications
  List<Event> _eventListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Event(
          headline: doc.data['headline'] ?? "",
          eventDetails: doc.data['eventDetails'] ?? "",
          startDate: doc.data['startDate'] ?? "",
          endDate: doc.data['endDate'] ?? "");
    }).toList();
  }

  Stream<List<Event>> get events {
    return eventCollection.snapshots().map(_eventListFromSnapshot);
  }

  Future updateEventData(String headline, String eventDetails, String startDate,
      String endDate) async {
    return await eventCollection.document(uid).setData({
      headline: headline,
      eventDetails: eventDetails,
      startDate: startDate,
      endDate: endDate
    });
  }
}
