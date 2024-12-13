class BannerModel {
  int? id;
  String? url;
  //constractur
  // BannerModel({
  //   this.id,
  //   this.url,
  // });
  //refactory fromJsom
  BannerModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    url = data['image'];
  }
}
