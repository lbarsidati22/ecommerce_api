class TestUserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  TestUserModel(
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
  );
  TestUserModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
  }
}
