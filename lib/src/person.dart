class Person {
  final id;
  final name;
  final email;
  final asset;

  Person({this.id, this.name, this.email, this.asset});

  Person.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          asset: json['asset'],
        );
}
