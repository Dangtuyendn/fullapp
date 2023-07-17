class Account {
  int? id;
  String? name;
  String? email;
  String? password;
  Account({this.id, this.name, this.email, this.password});
  @override
  String toString() {
    return '${this.name}';
  }

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
