import 'dart:convert';

class FriendModel {
  final String name;
  final String photoURL;

  FriendModel({
    required this.name,
    required this.photoURL,
  });

  //devolve uma instancia nova com um valor novo e endereço de memoria novo
  FriendModel copyWith({
    String? name,
    String? photoURL,
  }) {
    return FriendModel(
      name: name ?? this.name,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoURL': photoURL,
    };
  }

  factory FriendModel.fromMap(Map<String, dynamic> map) {
    return FriendModel(
      name: map['name'] ?? '',
      photoURL: map['photoURL'] ??
          'https://www.pikpng.com/pngl/b/263-2631740_empty-avatar-png-user-png-clipart.png',
    );
  }

  String toJson() => json.encode(toMap());

  factory FriendModel.fromJson(String source) =>
      FriendModel.fromMap(json.decode(source));

  @override
  String toString() => 'Friend(name: $name, photoURL: $photoURL)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FriendModel &&
        other.name == name &&
        other.photoURL == photoURL;
  }

  @override
  int get hashCode => name.hashCode ^ photoURL.hashCode;
}
