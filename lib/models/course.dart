import 'dart:convert';

class Course {
  String title;
  String description;
  String picture;
  String github;

  Course({
    this.title,
    this.description,
    this.picture,
    this.github,
  });

  Course copyWith({
    String title,
    String description,
    String picture,
    String github,
  }) {
    return Course(
      title: title ?? this.title,
      description: description ?? this.description,
      picture: picture ?? this.picture,
      github: github ?? this.github,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'picture': picture,
      'github': github,
    };
  }

  static Course fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Course(
      title: map['title'],
      description: map['description'],
      picture: map['picture'],
      github: map['github'],
    );
  }

  String toJson() => json.encode(toMap());

  static Course fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(title: $title, description: $description, picture: $picture, github: $github)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Course &&
        o.title == title &&
        o.description == description &&
        o.picture == picture &&
        o.github == github;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        picture.hashCode ^
        github.hashCode;
  }
}
