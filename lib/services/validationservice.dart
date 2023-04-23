class Valid {
  String? formvaild(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Something";
    }
    return null;
  }

  //This is Mobile number Validator
  String? mobilevalid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter a Phone Number";
    } else if (value.length != 10) {
      return "Please Enter a Valid Phone Number";
    }
    return null;
  }
}
