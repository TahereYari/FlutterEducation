class Product {
  int? id;
  String? name;
  int? price;
  String? description;
  int? counter;
  int? deleteStatuse;
  String? image;
  int? free;
  int? slider;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
        this.name,
        this.price,
        this.description,
        this.counter,
        this.deleteStatuse,
        this.image,
        this.free,
        this.slider,
        this.categoryId,
        this.createdAt,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    counter = json['counter'];
    deleteStatuse = json['deleteStatuse'];
    image = json['image'];
    free = json['free'];
    slider = json['slider'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['counter'] = counter;
    data['deleteStatuse'] = deleteStatuse;
    data['image'] = image;
    data['free'] = free;
    data['slider'] = slider;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
