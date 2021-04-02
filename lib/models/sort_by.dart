import 'package:radency_hometask/models/contacts.dart';

void sortByLastName() {
  contacts.sort((a, b) {
    var r = a["lastName"].compareTo(b["lastName"]);
    if (r != 0) return r;
    return a["firstName"].compareTo(b["firstName"]);
  });
}
