class Discount {
  int? id;
  int? precent;
  String? startdate;
  String? enddate;
  int? productId;
  int? deletestetuse;
  String? createdAt;
  String? updatedAt;

  Discount(
      {this.id,
        this.precent,
        this.startdate,
        this.enddate,
        this.productId,
        this.deletestetuse,
        this.createdAt,
        this.updatedAt});

  Discount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    precent = json['precent'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    productId = json['product_id'];
    deletestetuse = json['deletestetuse'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['precent'] = precent;
    data['startdate'] = startdate;
    data['enddate'] = enddate;
    data['product_id'] = productId;
    data['deletestetuse'] = deletestetuse;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
