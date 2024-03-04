class Site {
  int? id;
  String? name;
  String? tel;
  String? email;
  String? instagram;
  String? tweeter;
  String? facebook;
  String? telegram;
  String? address;
  String? descirbe;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? logo;

  Site(
      {this.id,
        this.name,
        this.tel,
        this.email,
        this.instagram,
        this.tweeter,
        this.facebook,
        this.telegram,
        this.address,
        this.descirbe,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.logo});

  Site.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tel = json['tel'];
    email = json['email'];
    instagram = json['instagram'];
    tweeter = json['tweeter'];
    facebook = json['facebook'];
    telegram = json['telegram'];
    address = json['address'];
    descirbe = json['descirbe'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['tel'] = tel;
    data['email'] = email;
    data['instagram'] = instagram;
    data['tweeter'] = tweeter;
    data['facebook'] = facebook;
    data['telegram'] = telegram;
    data['address'] = address;
    data['descirbe'] = descirbe;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['logo'] = logo;
    return data;
  }
}
