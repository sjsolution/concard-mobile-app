class DateTimeManueplate {
  String? giveDifferenceInTime(DateTime? dateTime) {
    String? sec = DateTime.now().difference(dateTime!).inSeconds.toString();
    if (int.parse(sec) > 60) {
      int? mints = DateTime.now().difference(dateTime).inMinutes;
      if (mints > 60) {
        int? hours = DateTime.now().difference(dateTime).inHours;
        if (hours > 24) {
          int? days = DateTime.now().difference(dateTime).inDays;
          return "$days days ago";
        } else {
          return "$hours hours ago";
        }
      } else {
        return "$mints mints ago";
      }
      // print("time is in mints");
    } else {
      return "$sec sec ago";
    }
  }
}
