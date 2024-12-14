class TestPrudactModel {
  String? image;
  String? description;
  String? name;
  int? discount;
  int? oldPrice;
  int? price;
  int? id;
  TestPrudactModel({
    this.description,
    this.discount,
    this.id,
    this.name,
    this.oldPrice,
    this.price,
    this.image,
  });
  TestPrudactModel.fromJson({required Map<String, dynamic> data}) {
    description = data['description'];
    name = data['name'];
    discount = data['discount'];
    id = data['id'];
    price = data['price'];
    oldPrice = data['old_price'];
    image = data['image'];
  }
}
