import 'package:circle/Services/CloudDB/microservices/contacts_db.dart';
import 'package:circle/Services/CloudDB/microservices/circles_db.dart';
import 'package:circle/Services/CloudDB/microservices/reminders_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDB {
  final String uid;
  final DocumentReference userDoc;
  final ContactsDB contactsDB;
  final CirclesDB circlesDB;
  final RemindersDB remindersDB;

  CloudDB(
    this.uid,
    this.userDoc,
    this.contactsDB,
    this.circlesDB,
    this.remindersDB,
  );

  CloudDB.fromUID(String uid)
      : this(
          uid,
          Firestore.instance.collection('users').document(uid),
          ContactsDB.fromUID(uid),
          CirclesDB.fromUID(uid),
          RemindersDB.fromUID(uid),
        );
//////////////////////////CONTACTS////////////////////////////////////
  Future<DocumentReference> addContact(Map<String, dynamic> newContact) async {
    return contactsDB.addContact(newContact);
  }

  Future<void> updateContact(
      DocumentReference contact, Map<String, dynamic> newContact) async {
    return contactsDB.updateContact(contact, newContact);
  }

  Future<void> deleteContacts(List<DocumentReference> contacts) async {
    return contactsDB.deleteContacts(contacts);
  }

  Future<void> deleteContact(DocumentReference contact) async {
    return contactsDB.deleteContact(contact);
  }

  Future<void> addNoteToContact(DocumentReference contact, String note) async {
    return contactsDB.addNoteToContact(contact, note);
  }

  Future<void> updateNote(DocumentReference oldNote, String note) async {
    return contactsDB.updateNote(oldNote, note);
  }

  Future<List<DocumentSnapshot>> getAllNotes(DocumentReference contact) async {
    QuerySnapshot allNotes = await contact.collection("notes").getDocuments();
    return allNotes.documents;
  }

  Future<List<DocumentSnapshot>> getAllContacts() async {
    return contactsDB.getAllContacts();
  }

//////////////////////////CIRCLES////////////////////////////////////
  Future<DocumentReference> addCircle(String circleName) async {
    return circlesDB.addCircle(circleName);
  }

  Future<void> renameCircle(DocumentReference circle, String newName) async {
    return circlesDB.renameCircle(circle, newName);
  }

  Future<List<DocumentSnapshot>> getAllCircles() async {
    return circlesDB.getAllCircles();
  }

  Future<List<DocumentSnapshot>> getCircleContacts(
      DocumentReference circle) async {
    return circlesDB.getCircleContacts(circle);
  }

  Future<DocumentSnapshot> getCircleByName(String circleName) async {
    return circlesDB.getCircleByName(circleName);
  }

  Future<void> deleteCircles(List<DocumentReference> circlesList) async {
    return circlesDB.deleteCircles(circlesList);
  }

  Future<void> addContactsToCircle(
      DocumentReference circle, List<DocumentReference> contacts) async {
    return circlesDB.addContactsToCircle(circle, contacts);
  }

  Future<void> removeContactsFromCircle(
      DocumentReference circle, List<DocumentReference> circleContacts) async {
    return circlesDB.removeContactsFromCircle(circle, circleContacts);
  }

//////////////////////////REMINDERS////////////////////////////////////
  Future<DocumentReference> addReminder(
      Map<String, dynamic> newReminder) async {
    return remindersDB.addReminder(newReminder);
  }

  Future<void> deleteReminders(List<DocumentReference> reminders) async {
    return remindersDB.deleteReminders(reminders);
  }

  Future<void> updateReminder(
      DocumentReference reminder, Map<String, dynamic> newReminder) async {
    return remindersDB.updateReminder(reminder, newReminder);
  }

  Future<List<DocumentSnapshot>> getAllRemindersByContact(
    DocumentReference contact,
  ) async {
    return remindersDB.getAllRemindersByContact(contact);
  }

  Future<List<DocumentSnapshot>> getAllIncompleteReminders() async {
    return remindersDB.getAllIncompleteReminders();
  }

  Future<List<DocumentSnapshot>> getAllCompletedReminders() async {
    return remindersDB.getAllCompletedReminders();
  }

  Future<List<DocumentSnapshot>> getAllReminders() async {
    return remindersDB.getAllReminders();
  }

  Future<List<DocumentSnapshot>> getAllFutureReminders() async {
    return remindersDB.getAllFutureReminders();
  }

  Future<List<DocumentSnapshot>> getAllPastReminders() async {
    return remindersDB.getAllPastReminders();
  }

  Future<List<DocumentSnapshot>> getAllFutureIncompleteReminders() async {
    return remindersDB.getAllFutureCompletedReminders();
  }

  Future<List<DocumentSnapshot>> getAllFutureCompletedReminders() async {
    return remindersDB.getAllFutureCompletedReminders();
  }

  Future<List<DocumentSnapshot>> getAllPastIncompleteReminders() async {
    return remindersDB.getAllPastIncompleteReminders();
  }

  Future<List<DocumentSnapshot>> getAllPastCompletedReminders() async {
    return remindersDB.getAllPastCompletedReminders();
  }

  void printData() {
    print("USER ID FROM CLOUD_DB: " + this.uid);
    print(this.userDoc);
  }
}
