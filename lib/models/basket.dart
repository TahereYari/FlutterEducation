class Basket {
  int? id;
  int? price;
  int? isPay;
  int? invoiceNumber;
  int? offprice;
  int? offcode;
  int? userId;
  int? offcodeId;
  String? createdAt;
  String? updatedAt;

  Basket(
      {this.id,
        this.price,
        this.isPay,
        this.invoiceNumber,
        this.offprice,
        this.offcode,
        this.userId,
        this.offcodeId,
        this.createdAt,
        this.updatedAt});

  Basket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    isPay = json['is_pay'];
    invoiceNumber = json['invoiceNumber'];
    offprice = json['offprice'];
    offcode = json['offcode'];
    userId = json['user_id'];
    offcodeId = json['offcode_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['price'] = price;
    data['is_pay'] = isPay;
    data['invoiceNumber'] = invoiceNumber;
    data['offprice'] = offprice;
    data['offcode'] = offcode;
    data['user_id'] = userId;
    data['offcode_id'] = offcodeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
