class Product {
  late String sId;
  late   String name;
  late String image;
  late int total;
  late int price;

  Product({required this.sId, required this.name, required this.image, required this.total,required this.price});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    total = json['total'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['total'] = this.total;
    data['price'] = this.price;
    return data;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Product &&
        o.sId == sId &&
        o.name == name &&
        o.image == image &&
        o.total == total &&
        o.price == price;
  }

  @override
  int get hashCode {
    return sId.hashCode ^
    name.hashCode ^
    image.hashCode ^
    total.hashCode ^
    price.hashCode;
  }
}