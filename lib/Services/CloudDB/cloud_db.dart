import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDB {
  final String uid;
  final DocumentReference userDoc;
  CloudDB(this.uid, this.userDoc);

  CloudDB.fromUID(String uid)
      : this(uid, Firestore.instance.collection('users').document(uid));

  Future<DocumentReference> addContact(Map<String, dynamic> newContact) async {
    try {
      return await userDoc.collection("contacts").add(newContact);
    } catch (e) {
      print("Add Contact Failed ... See clouDB.dart");
      return null;
    }
  }

  void printData() {
    print("USER ID FROM CLOUD_DB: " + this.uid);
    print(this.userDoc);
  }
}
