class User {
  final String id;
  final String firstName;
  final String surname;
  final String email;

  User(
      {required this.id,
      required this.firstName,
      required this.surname,
      required this.email});

  User.fromJson(Map json)
      : id = json["_id"],
        firstName = json["first_name"],
        surname = json["surname"],
        email = json["email"];

  Map toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'surname': surname,
      'email': email
    };
  }
}
