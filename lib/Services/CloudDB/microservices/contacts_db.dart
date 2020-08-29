import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsDB {
  final String uid;
  final CollectionReference userContacts;
  ContactsDB(this.uid, this.userContacts);

  ContactsDB.fromUID(String uid)
      : this(
          uid,
          Firestore.instance
              .collection('users')
              .document(uid)
              .collection("contacts"),
        );
  Future<DocumentReference> addContact(Map<String, dynamic> newContact) async {
    return userContacts.add(newContact);
  }

  Future<void> updateContact(
      DocumentReference contact, Map<String, dynamic> newContact) async {
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
        // await userDoc.collection("contacts").getDocuments();
        await userContacts.getDocuments();
    return allContacts.documents;
  }
}
