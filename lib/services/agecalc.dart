class AgeCalc {
  String calculateAge(DateTime dob) {
    Duration dur = DateTime.now().difference(dob);
    final diff = (dur.inDays / 365).floor();
    return "$diff";
  }
}
