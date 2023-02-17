class UserModel {
  dynamic name, email, password, isActive, friends;
  UserModel(
      {this.name, this.email, this.friends, this.isActive, this.password});

  factory UserModel.fromJson(data) => UserModel(
      email: data['email'],
      name: data['name'],
      isActive: data['isActive'],
      friends: data['friends']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email.toString().toLowerCase(),
        'isActive': isActive,
        'friends': friends ?? [],
      };
}
