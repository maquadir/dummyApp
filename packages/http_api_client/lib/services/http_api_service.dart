import 'dart:async';
import 'dart:convert';

import 'package:result_type/result.dart';
import 'package:http/http.dart' as http;

/// A HTTP service for API endpoints
class HttpApiService {
  const HttpApiService();

  /// Perform a HTTP get, returning the response body as a [String]
  Future<Result<String>> httpGet(Uri uri) async {
    final client = http.Client();
    try {
      http.Response response = await client.get(uri);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return Result(value: utf8.decode(response.bodyBytes));
      } else {
        return const Result(error: 'Unexpected http response');
      }
    } on http.ClientException {
      return const Result(error: 'Request failed; http client exception');
    } on TimeoutException {
      return const Result(error: 'Request failed; http timeout');
    } catch (e) {
      return Result(error: 'Request failed; $e');
    } finally {
      client.close();
    }
  }

  Future<Result<String>> httpDelete(Uri uri) async {
    final client = http.Client();
    try {
      http.Response response = await client.delete(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return Result(value: utf8.decode(response.bodyBytes));
      } else {
        return const Result(error: 'Unexpected http response');
      }
    } on http.ClientException {
      return const Result(error: 'Request failed; http client exception');
    } on TimeoutException {
      return const Result(error: 'Request failed; http timeout');
    } catch (e) {
      return Result(error: 'Request failed; $e');
    } finally {
      client.close();
    }
  }
}
