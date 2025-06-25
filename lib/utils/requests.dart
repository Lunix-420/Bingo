import 'dart:convert';

import 'package:frontend/utils/named_logger.dart';
import 'package:http/http.dart' as http;

final logger = namedLogger("Requests");

class Requests {
  static Future<dynamic> get(Uri url) async {
    logger.d('GET request to $url');
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      logger.d('Response from $url: ${response.body}');
      return jsonDecode(response.body);
    } else {
      logger.e(
        'Failed to fetch data from $url (status: ${response.statusCode}, body: ${response.body})',
      );
      throw Exception(
        'Failed to fetch data from $url (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }

  static Future<List<dynamic>> getList(Uri url) async {
    return await get(url) as List<dynamic>;
  }

  static Future<Map<String, dynamic>> getMap(Uri url) async {
    return await get(url) as Map<String, dynamic>;
  }

  static Future<dynamic> post(Uri url, String body) async {
    logger.d('POST request to $url with body: $body');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      logger.d('Response from $url: ${response.body}');
      return jsonDecode(response.body);
    } else {
      logger.e(
        'Failed to post data to $url (status: ${response.statusCode}, body: ${response.body})',
      );
      throw Exception(
        'Failed to post data to $url (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }

  static Future<List<dynamic>> postList(Uri url, String body) async {
    return await post(url, body) as List<dynamic>;
  }

  static Future<Map<String, dynamic>> postMap(Uri url, String body) async {
    return await post(url, body) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> put(Uri url, String body) async {
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Failed to put data to $url (status: ${response.statusCode}, body: ${response.body})',
      );
    }
  }
}
