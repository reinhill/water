class Users {
  final String id;
  final String nickname;
  final String password;
  final String email;
  final String age;

  Users({
    required this.id,
    required this.nickname,
    required this.password,
    required this.email,
    required this.age
    

  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'password': password,
        'name': nickname,
        'email': email,
        'age': age,
      };

  static Users fromJson(Map<String, dynamic> json) => Users(
        id: json['id'],
        nickname: json['nickname'],
        password: json['password'],
        email: json['email'],
        age: json['age'],
      );
}
