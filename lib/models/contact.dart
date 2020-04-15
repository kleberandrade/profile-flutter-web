import 'dart:convert';

class Contact {
  String name;
  String email;
  String message;

  Contact({
    this.name,
    this.email,
    this.message,
  });

  String toParams() => "?name=$name&email=$email&message=$message";

  Contact copyWith({
    String name,
    String email,
    String message,
  }) {
    return Contact(
      name: name ?? this.name,
      email: email ?? this.email,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'message': message,
    };
  }

  static Contact fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Contact(
      name: map['name'],
      email: map['email'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  static Contact fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Contact(name: $name, email: $email, message: $message)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Contact &&
        o.name == name &&
        o.email == email &&
        o.message == message;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ message.hashCode;
}
