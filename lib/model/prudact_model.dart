class PrudactModel {
  String? name;
  String? image;
  String? description;
  int? discount;
  int? price;
  int? id;
  int? oldprice;
  //constractor
  PrudactModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'].toInt();
    price = data['price'].toInt();
    oldprice = data['old_price'].toInt();
    discount = data['discount'].toInt();
    image = data['image'].toString();
    name = data['name'].toString();
    description = data['description'].toString();
  }
}
