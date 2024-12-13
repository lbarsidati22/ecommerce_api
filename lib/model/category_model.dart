class CategoryModel {
  int? id;
  String? url;
  String? title;
  //constractur
  // BannerModel({
  //   this.id,
  //   this.url,
  // });
  //refactory fromJsom
  CategoryModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    url = data['image'];
    title = data['name'];
  }
}
