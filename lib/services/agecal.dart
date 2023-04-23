// ignore_for_file: unused_element

class AgeCalc {
  String calculateAge(DateTime dob) {
    DateTime currentDate = DateTime.now();

    int years = currentDate.year - dob.year;
    int months = currentDate.month - dob.month;
    int days = currentDate.day - dob.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months = (currentDate.month + 12 - dob.month) % 12;
      days = (days + daysInMonth(currentDate.month - 1, currentDate.year)) %
          daysInMonth(currentDate.month - 1, currentDate.year);
    }

    String yearString = (years == 1) ? 'year' : 'years';
    String monthString = (months == 1) ? 'month' : 'months';
    String dayString = (days == 1) ? 'day' : 'days';

    return '$years $yearString, $months $monthString, and $days $dayString old';
  }

  int daysInMonth(int month, int year) {
    // 0 -> January, 1 -> February, ...
    const List<int> daysInMonths = [
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    if (month == 1 && isLeapYear(year)) {
      return 29;
    }
    return daysInMonths[month];
  }

  bool isLeapYear(int year) {
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
      return true;
    }
    return false;
  }
}
