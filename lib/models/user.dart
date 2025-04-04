class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  String? avatarBase64; 

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    this.avatarBase64,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
      avatarBase64: json['avatarBase64'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      if (avatarBase64 != null) 'avatarBase64': avatarBase64,
    };
  }
}
