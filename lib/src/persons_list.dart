import 'dart:convert';

import 'package:flutter/services.dart';

import 'person.dart';

export 'person.dart';

Future<String> _getLocalJson() async {
  return await rootBundle.loadString('assets/persons.json');
}

Future<List<Person>> personsList() async {
  final jsonString = await _getLocalJson();
  final data = json.decode(jsonString);
  final persons = data['persons'] as List<dynamic>;
  final personsList = persons.map((person) => Person.fromJson(person)).toList();
  return personsList;
}
