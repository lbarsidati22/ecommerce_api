class TestBannersModel {
  int? id;
  String? image;
  // TestBannersModel(this.id, this.image);
  TestBannersModel.formJson({required Map<String, dynamic> data}) {
    id = data['id'];
    image = data['image'];
  }
}
