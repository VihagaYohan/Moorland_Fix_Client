class Constants {
  // font families
  static const String fontFamilyPoppins = "Poppins";

  // spaces
  static const double spaceSmall = 8.0;
  static const double spaceMedium = 16.0;
  static const double spaceLarge = 24.0;

  // encrypted storage keys
  static const String userKey = "user";
  static const String isAdminKey = "isAdmin";

  // appointment status
  static const String booked = "Booked";
  static const String cancelled = "Cancelled";
  static const String completed = "Completed";
  static const String pending = "Pending";

  // appointment status list
  static  List<StatusList> statusList = [
    StatusList(uid: "1", name: booked),
    StatusList(uid: "2", name: completed),
    StatusList(uid: "3", name: cancelled),
    StatusList(uid: "4", name: pending)
  ];

}

class StatusList {
  String uid;
  String name;

  StatusList({
    required this.uid,
    required this.name
});
}