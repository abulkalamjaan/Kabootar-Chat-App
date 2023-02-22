class UserModel {
  dynamic name, email, password, isActive, friends, photo;
  UserModel(
      {this.name,
      this.email,
      this.friends,
      this.isActive,
      this.password,
      this.photo});

  factory UserModel.fromJson(data) => UserModel(
      email: data['email'],
      name: data['name'],
      photo: data['photo'],
      isActive: data['isActive'],
      friends: data['friends']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'photo': photo,
        'email': email.toString().toLowerCase(),
        'isActive': isActive,
        'friends': friends ?? [],
      };
}
