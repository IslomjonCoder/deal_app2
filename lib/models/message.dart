class Message {
  String content;
  DateTime dateTime;
  String senderId;
  String whoId;
  String id;

  Message({
    required this.id,
    required this.content,
    required this.dateTime,
    required this.senderId,
    required this.whoId,
  });

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'dateTime': dateTime.toIso8601String(),
      'senderId': senderId,
      'whoId': whoId,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      content: json['content'],
      dateTime: DateTime.parse(json['dateTime']),
      senderId: json['senderId'],
      whoId: json['whoId'],
    );
  }

  @override
  String toString() {
    return 'Message{id $id, content: $content, dateTime: $dateTime, senderId: $senderId, whoId: $whoId} ';
  }
}
