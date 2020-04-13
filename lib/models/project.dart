import 'dart:convert';

class Project {
  String title;
  String description;
  String lastDate;
  String picture;
  String github;
  String facebook;
  String youtube;
  String playstore;
  String itchio;

  Project({
    this.title,
    this.description,
    this.lastDate,
    this.picture,
    this.github,
    this.facebook,
    this.youtube,
    this.playstore,
    this.itchio,
  });

  Project copyWith({
    String title,
    String description,
    String lastDate,
    String picture,
    String github,
    String facebook,
    String youtube,
    String playstore,
    String itchio,
  }) {
    return Project(
      title: title ?? this.title,
      description: description ?? this.description,
      lastDate: lastDate ?? this.lastDate,
      picture: picture ?? this.picture,
      github: github ?? this.github,
      facebook: facebook ?? this.facebook,
      youtube: youtube ?? this.youtube,
      playstore: playstore ?? this.playstore,
      itchio: itchio ?? this.itchio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'lastDate': lastDate,
      'picture': picture,
      'github': github,
      'facebook': facebook,
      'youtube': youtube,
      'playstore': playstore,
      'itchio': itchio,
    };
  }

  static Project fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Project(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      lastDate: map['lastDate'] ?? '',
      picture: map['picture'] ?? '',
      github: map['github'] ?? '',
      facebook: map['facebook'] ?? '',
      youtube: map['youtube'] ?? '',
      playstore: map['playstore'] ?? '',
      itchio: map['itchio'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  static Project fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Project(title: $title, description: $description, lastDate: $lastDate, picture: $picture, github: $github, facebook: $facebook, youtube: $youtube, playstore: $playstore, itchio: $itchio)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Project &&
        o.title == title &&
        o.description == description &&
        o.lastDate == lastDate &&
        o.picture == picture &&
        o.github == github &&
        o.facebook == facebook &&
        o.youtube == youtube &&
        o.playstore == playstore &&
        o.itchio == itchio;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        lastDate.hashCode ^
        picture.hashCode ^
        github.hashCode ^
        facebook.hashCode ^
        youtube.hashCode ^
        playstore.hashCode ^
        itchio.hashCode;
  }
}
