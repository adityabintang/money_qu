class EditProfileModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  EditProfileModel({
    this.username,
    this.password,
    this.email,
    this.name,
  });

  EditProfileModel copyWith({
     String? username,
     String? name,
     String? email,
     String? password,
  }) =>
      EditProfileModel(
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
    name: json["name"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "email": email,
    "password": password,
  };
}
