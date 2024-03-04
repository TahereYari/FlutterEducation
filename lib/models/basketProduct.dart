class BasketProduct {
  int? id;
  int? basketId;
  int? productId;
  int? price;
  int? offprice;
  String? createdAt;
  String? updatedAt;
  int? pricefull;

  BasketProduct(
      {this.id,
        this.basketId,
        this.productId,
        this.price,
        this.offprice,
        this.createdAt,
        this.updatedAt,
        this.pricefull});

  BasketProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    basketId = json['basket_id'];
    productId = json['product_id'];
    price = json['price'];
    offprice = json['offprice'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pricefull = json['pricefull'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] =id;
    data['basket_id'] = basketId;
    data['product_id'] = productId;
    data['price'] = price;
    data['offprice'] = offprice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['pricefull'] = pricefull;
    return data;
  }
}
