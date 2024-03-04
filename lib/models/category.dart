class Category {
  int? id;
  String? name;
  String? description;
  String? image;
  int? deleteStatuse;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.deleteStatuse,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    deleteStatuse = json['DeleteStatuse'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['DeleteStatuse'] = deleteStatuse;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
