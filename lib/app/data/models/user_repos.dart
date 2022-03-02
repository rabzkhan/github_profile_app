import 'dart:convert';

class Repos {
  String name;
  String html_url;
  Repos({
    required this.name,
    required this.html_url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'html_url': html_url,
    };
  }

  factory Repos.fromMap(Map<String, dynamic> map) {
    return Repos(
      name: map['name'],
      html_url: map['html_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Repos.fromJson(String source) => Repos.fromMap(json.decode(source));
}
