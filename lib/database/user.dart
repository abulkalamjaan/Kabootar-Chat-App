class UserModel {
  dynamic name, email, password;

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'pass': password};
}
