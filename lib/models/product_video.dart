class ProductVideo {
  int? id;
  String? name;
  String? video;
  int? productId;
  int? videoCategoryId;
  String? createdAt;
  String? updatedAt;

  ProductVideo(
      {this.id,
        this.name,
        this.video,
        this.productId,
        this.videoCategoryId,
        this.createdAt,
        this.updatedAt});

  ProductVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    video = json['video'];
    productId = json['product_id'];
    videoCategoryId = json['videoCategory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['video'] = video;
    data['product_id'] = productId;
    data['videoCategory_id'] = videoCategoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
