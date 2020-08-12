import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDB {
  final String uid;
  final DocumentReference userDoc;
  CloudDB(this.uid, this.userDoc);

  CloudDB.fromUID(String uid)
      : this(uid, Firestore.instance.collection('users').document(uid));

  Future<DocumentReference> addContact(Map<String, dynamic> newContact) async {
    return await userDoc.collection("contacts").add(newContact);
  }
}
