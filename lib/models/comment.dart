class Comment {
  int? id;
  String? comment;
  int? productId;
  int? userId;
  int? preview;
  String? createdAt;
  String? updatedAt;

  Comment(
      {this.id,
        this.comment,
        this.productId,
        this.userId,
        this.preview,
        this.createdAt,
        this.updatedAt});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    productId = json['product_id'];
    userId = json['user_id'];
    preview = json['preview'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['comment'] = comment;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['preview'] = preview;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
