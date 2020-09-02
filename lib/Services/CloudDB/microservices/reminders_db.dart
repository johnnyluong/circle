import 'package:cloud_firestore/cloud_firestore.dart';

class RemindersDB {
  final String uid;
  final CollectionReference userReminders;
  RemindersDB(this.uid, this.userReminders);

  RemindersDB.fromUID(String uid)
      : this(
          uid,
          Firestore.instance
              .collection('users')
              .document(uid)
              .collection("reminders"),
        );

  Future<DocumentReference> addReminder(
      Map<String, dynamic> newReminder) async {
    return userReminders.add(newReminder);
  }

  Future<void> deleteReminders(List<DocumentReference> reminders) async {
    for (var i = 0; i < reminders.length; i++) {
      Future<void> del = reminders[i].delete();
      del
          .then((void _) => print("Reminder deleted successfully"))
          .catchError((e) => print("Reminder deletion failed."));
    }
  }

  Future<void> updateReminder(
      DocumentReference reminder, Map<String, dynamic> newReminder) async {
    //todo
    return reminder.updateData(newReminder);
  }

  Future<List<DocumentSnapshot>> getAllRemindersByContact(
    DocumentReference contact,
  ) async {
    Query query = userReminders.where("contacts", arrayContains: contact);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 0) {
      return new List();
    } else {
      return list;
    }
  }

  Future<List<DocumentSnapshot>> getAllIncompleteReminders() async {
    Query query = userReminders.where("isComplete", isEqualTo: false);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 0) {
      return new List();
    } else {
      return list;
    }
  }

  Future<List<DocumentSnapshot>> getAllCompletedReminders() async {
    Query query = userReminders.where("isComplete", isEqualTo: true);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 0) {
      return new List();
    } else {
      return list;
    }
  }

  Future<List<DocumentSnapshot>> getAllReminders() async {
    QuerySnapshot allReminders = await userReminders.getDocuments();
    if (allReminders.documents == null) {
      return new List();
    }
    return allReminders.documents;
  }

  Future<List<DocumentSnapshot>> getAllFutureReminders() async {
    Timestamp now = Timestamp.now();
    Query query = userReminders.where("reminderDateTime", isGreaterThan: now);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 0) {
      return new List();
    } else {
      return list;
    }
  }

  Future<List<DocumentSnapshot>> getAllPastReminders() async {
    Timestamp now = Timestamp.now();
    Query query = userReminders.where("reminderDateTime", isLessThan: now);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 0) {
      return new List();
    } else {
      return list;
    }
  }

  Future<List<DocumentSnapshot>> getAllFutureIncompleteReminders() async {
    Timestamp now = Timestamp.now();
    Query query = userReminders
        .where("reminderDateTime", isGreaterThan: now)
        .where("isComplete", isEqualTo: false);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 0) {
      return new List();
    } else {
      return list;
    }
  }

  Future<List<DocumentSnapshot>> getAllFutureCompletedReminders() async {
    Timestamp now = Timestamp.now();
    Query query = userReminders
        .where("reminderDateTime", isGreaterThan: now)
        .where("isComplete", isEqualTo: true);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 0) {
      return new List();
    } else {
      return list;
    }
  }

  Future<List<DocumentSnapshot>> getAllPastIncompleteReminders() async {
    Timestamp now = Timestamp.now();
    Query query = userReminders
        .where("reminderDateTime", isLessThan: now)
        .where("isComplete", isEqualTo: false);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 0) {
      return new List();
    } else {
      return list;
    }
  }

  Future<List<DocumentSnapshot>> getAllPastCompletedReminders() async {
    Timestamp now = Timestamp.now();
    Query query = userReminders
        .where("reminderDateTime", isLessThan: now)
        .where("isComplete", isEqualTo: true);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 0) {
      return new List();
    } else {
      return list;
    }
  }
}
