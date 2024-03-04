class Ticket {
  int? id;
  int? supportId;
  int? userId;
  int? productId;
  int? status;
  String? title;
  String? createdAt;
  String? updatedAt;

  Ticket(
      {this.id,
        this.supportId,
        this.userId,
        this.productId,
        this.status,
        this.title,
        this.createdAt,
        this.updatedAt});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supportId = json['support_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    status = json['status'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['support_id'] = supportId;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['status'] = status;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
