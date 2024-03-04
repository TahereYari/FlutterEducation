class Message {
  int? id;
  int? supportId;
  int? userId;
  int? ticketId;
  String? message;
  String? createdAt;
  String? updatedAt;
  int? seen;

  Message(
      {this.id,
        this.supportId,
        this.userId,
        this.ticketId,
        this.message,
        this.createdAt,
        this.updatedAt,
        this.seen});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supportId = json['support_id'];
    userId = json['user_id'];
    ticketId = json['ticket_id'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    seen = json['seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['support_id'] = supportId;
    data['user_id'] = userId;
    data['ticket_id'] = ticketId;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['seen'] = seen;
    return data;
  }
}
