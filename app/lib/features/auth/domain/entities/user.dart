enum Gender { homme, femme }

extension EnumParsingGender on Gender {
  toStringValue() {
    return toString().split('.').last;
  }

  static Gender fromString(String value) {
    return Gender.values
        .firstWhere((element) => element.toStringValue() == value);
  }
}

enum CronicDisease {
  maladieRespiratoire,
  maladieCardiaque,
  diabete,
  cancer,
  maladieRenale,
  none,
}

extension EnumParsingCronic on CronicDisease {
  toStringValue() {
    return toString().split('.').last;
  }

  static CronicDisease fromString(String value) {
    return CronicDisease.values
        .firstWhere((element) => element.toStringValue() == value);
  }
}

class User {
  int userId;

  String firstName;
  String lastName;
  DateTime dateOfBirth;
  String email;
  String password;
  CronicDisease cronicDisease1;
  CronicDisease cronicDisease2;
  CronicDisease cronicDisease3;
  CronicDisease cronicDisease4;
  CronicDisease cronicDisease5;
  Gender gender;
  double latitude;
  double longitude;
  bool ifTransmit;
  DateTime dateOfContamination;
  double? recommandation;
  int? clusterId;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.email,
    required this.password,
    required this.cronicDisease1,
    required this.cronicDisease2,
    required this.cronicDisease3,
    required this.cronicDisease4,
    required this.cronicDisease5,
    required this.gender,
    required this.latitude,
    required this.longitude,
    required this.ifTransmit,
    required this.dateOfContamination,
    this.recommandation,
    this.clusterId,
  });
}
