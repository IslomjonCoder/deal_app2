class Event {
  String title;
  String about;
  int cost;
  DateTime date;
  String address;
  String image;
  String id;

  Event({
    required this.title,
    required this.about,
    required this.cost,
    required this.date,
    required this.address,
    required this.image,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'about': about,
      'cost': cost,
      'date': date.toIso8601String(),
      'address': address,
      'image': image,
    };
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      id: json['id'],
      about: json['about'],
      cost: json['cost'],
      date: DateTime.parse(json['date']),
      address: json['adress'],
      image: json['image'],
    );
  }

  @override
  String toString() {
    return 'Event{title: $title, id: $id, about: $about, cost: $cost, date: $date, address: $address, image: $image}';
  }
}
