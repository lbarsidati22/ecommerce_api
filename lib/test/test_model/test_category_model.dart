class TestCategoryModel {
  String? image;
  String? title;
  int? id;
  TestCategoryModel(this.id, this.image, this.title);
  TestCategoryModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    title = data['name'];
    image = data['image'];
  }
}
