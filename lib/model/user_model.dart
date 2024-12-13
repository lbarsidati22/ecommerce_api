class UserModel {
  String? name;
  String? email;
  String? image;
  String? phone;
  String? token;
  UserModel({
    this.name,
    this.email,
    this.image,
    this.phone,
    this.token,
  });
  UserModel.formJson({required Map<String, dynamic> data}) {
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
    token = data['token'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'token': token,
    };
  }
}
