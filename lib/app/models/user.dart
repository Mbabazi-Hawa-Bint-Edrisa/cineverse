class User{
  String? username;
  String? email;
  String? password;
  int? id;
  bool? privacy;


  User({this.username, this.email, this.password, this.id, this.privacy});

  User.fromJson(Map<String, dynamic> json) {
    username= json['username'];
    email= json['email'];
    password= json['password'];
    id= json['id'];
    privacy= json['privacy'];
  }

}

