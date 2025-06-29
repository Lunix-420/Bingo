import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/utils/requests.dart';

void main() {
  group('Requests', () {
    test('GET request failure', () async {
      final url = Uri.parse('https://localhost:8080/failure');

      expect(() async => await Requests.get(url), throwsException);
    });

    test('POST request failure', () async {
      final url = Uri.parse('https://localhost:8080/failure');
      final body = jsonEncode({'key': 'value'});

      expect(() async => await Requests.post(url, body), throwsException);
    });

    test('PUT request failure', () async {
      final url = Uri.parse('https://localhost:8080/failure');
      final body = jsonEncode({'key': 'value'});

      expect(() async => await Requests.put(url, body), throwsException);
    });
  });
}
