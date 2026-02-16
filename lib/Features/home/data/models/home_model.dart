class HomeModel {
  final String name;
  final String imageUrl;
  final String description;
  final String time;
  final String rate;

  HomeModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.time,
    required this.rate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'time': time,
      'rate': rate,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      name: map['name'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      time: map['time'],
      rate: map['rate'],
    );
  }
}
