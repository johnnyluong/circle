import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDB {
  final String uid;
  final DocumentReference userDoc;
  CloudDB(this.uid, this.userDoc);

  CloudDB.fromUID(String uid)
      : this(uid, Firestore.instance.collection('users').document(uid));

  Future<DocumentReference> addContact(Map<String, dynamic> newContact) async {
    // try {
    return userDoc.collection("contacts").add(newContact);
    // } catch (e) {
    //   print("Add Contact Failed ... See cloud_DB.dart");
    //   return null;
    // }
  }

  Future<void> updateContact(
      DocumentReference contact, Map<String, dynamic> newContact) async {
    // await contact.setData(newContact);
    return contact.updateData(newContact);
  }

  Future<void> deleteContacts(List<DocumentReference> contacts) async {
    for (var i = 0; i < contacts.length; i++) {
      Future<void> del = contacts[i].delete();
      del
          .then((void _) => print("Contact deleted successfully"))
          .catchError((e) => print("Contact deletion failed."));
    }
  }

  Future<void> deleteContact(DocumentReference contact) async {
    Future<void> del = contact.delete();
    del
        .then((void _) => print("Contact deleted successfully"))
        .catchError((e) => print("Contact deletion failed."));
  }

  Future<void> addNoteToContact(DocumentReference contact, String note) async {
    contact.collection("notes").add({"note": note});
  }

  Future<void> updateNote(DocumentReference oldNote, String note) async {
    oldNote.updateData({"note": note});
  }

  Future<List<DocumentSnapshot>> getAllNotes(DocumentReference contact) async {
    QuerySnapshot allNotes = await contact.collection("notes").getDocuments();
    return allNotes.documents;
  }

  Future<List<DocumentSnapshot>> getAllContacts() async {
    QuerySnapshot allContacts =
        await userDoc.collection("contacts").getDocuments();
    // List<DocumentSnapshot> list = allContacts.documents;
    // allContacts
    //     .then((QuerySnapshot all) => list = all.documents)
    //     .catchError((e) => print("getAllContacts method failed."));
    // for (int i = 0; i < list.length; i++) {
    //   print(list[i].data.toString());
    // }
    return allContacts.documents;
  }

  Future<DocumentReference> addCircle(String circleName) async {
    return userDoc.collection("circles").add({"circleName": circleName});
  }

  Future<void> renameCircle(DocumentReference circle, String newName) async {
    return circle.updateData({"circleName": newName});
  }

  Future<List<DocumentSnapshot>> getAllCircles() async {
    QuerySnapshot allCircles =
        await userDoc.collection("circles").getDocuments();
    return allCircles.documents;
  }

  Future<List<DocumentSnapshot>> getCircleContacts(
      DocumentReference circle) async {
    QuerySnapshot allContacts =
        await circle.collection("circleContacts").getDocuments();
    return allContacts.documents;
  }

  Future<DocumentSnapshot> getCircleByName(String circleName) async {
    Query query = userDoc
        .collection("circles")
        .where("circleName", isEqualTo: circleName);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 1) {
      return list[0];
    } else {
      return null;
    }
  }

  Future<void> deleteCircles(List<DocumentReference> circlesList) async {
    for (var i = 0; i < circlesList.length; i++) {
      Future<void> del = circlesList[i].delete();
      del
          .then((void _) => print("Circle deleted successfully"))
          .catchError((e) => print("Circle deletion failed."));
    }
  }

  Future<void> addContactsToCircle(
      DocumentReference circle, List<DocumentReference> contacts) async {
    for (var i = 0; i < contacts.length; i++) {
      // circle
      //     .collection("circleContacts")
      //     .add({"circleContact": contacts[i].path});
      circle.collection("circleContacts").add({"circleContact": contacts[i]});
    }
  }

  Future<void> removeContactsFromCircle(
      DocumentReference circle, List<DocumentReference> circleContacts) async {
    for (var i = 0; i < circleContacts.length; i++) {
      Future<void> del = circleContacts[i].delete();
      del
          .then((void _) => print("Contact deleted successfully"))
          .catchError((e) => print("Contact deletion failed."));
    }
  }

  void printData() {
    print("USER ID FROM CLOUD_DB: " + this.uid);
    print(this.userDoc);
  }
}
