class User {
  late final String userName;
  late final String password;
  late final int score;
  late int? id;
  User(this.userName, this.score, this.password, {this.id});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    score = json['score'];
    id = json['id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'score': score,
      'password': password
    };
  }

  bool operator ==(Object other) {
    return (other is User) &&
        (userName == other.userName && password == other.password);
  }
}
