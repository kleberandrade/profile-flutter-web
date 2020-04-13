import 'dart:convert';

import 'package:flutter/material.dart';

class SocialNetwork {
  IconData icon;
  String url;
  SocialNetwork({
    this.icon,
    this.url,
  });

  SocialNetwork copyWith({
    IconData icon,
    String url,
  }) {
    return SocialNetwork(
      icon: icon ?? this.icon,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icon': icon.codePoint,
      'url': url,
    };
  }

  static SocialNetwork fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SocialNetwork(
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  static SocialNetwork fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'SocialNetwork(icon: $icon, url: $url)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SocialNetwork && o.icon == icon && o.url == url;
  }

  @override
  int get hashCode => icon.hashCode ^ url.hashCode;
}
