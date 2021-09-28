import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:umami/providers/local-storage_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryProvider {
  final localStorage = LocalStorage();

  static String uriAPI = "http://10.0.2.2:3000/api";

  Future postRequest(String uri, String ext, Map<String, dynamic> body) async {
    final _url = uri + ext;
    final resp = await http.post(
      Uri.parse(_url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: localStorage.userToken,
      },
      body: json.encode(body),
    );
    final int statusCode = resp.statusCode;

    if (resp.body.isNotEmpty) {
      final decodedData = json.decode(resp.body);
      return decodedData;
    }
    if (statusCode < 200 || statusCode > 399) {
      return statusCode;
    }

    return resp.statusCode;
  }

  Future<Response> postRequestWithStatusCode(
      String uri, String ext, Map body) async {
    final _url = uri + ext;
    final resp = await http.post(
      Uri.parse(_url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: localStorage.userToken,
      },
      body: json.encode(body),
    );

    return resp;
  }

  Future<Response> postRequestList(
      String uri, String ext, List<Map> body) async {
    final _url = uri + ext;
    final resp = await http.post(
      Uri.parse(_url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: localStorage.userToken,
        // HttpHeaders.cookieHeader: localStorage.cookie
      },
      body: json.encode(body),
    );

    return resp;
  }

  Future putRequest(String uri, String ext, Map body) async {
    final _url = uri + ext;
    final resp = await http.put(Uri.parse(_url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: localStorage.userToken,
        },
        body: json.encode(body));
    final int statusCode = resp.statusCode;
    if (statusCode < 200 || statusCode > 399) {
      return statusCode;
    }
    final decodedData = json.decode(resp.body);
    return decodedData;
  }

  Future<Response> putRequestCode(String uri, String ext, Map body) async {
    final _url = uri + ext;
    final resp = await http.put(Uri.parse(_url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: localStorage.userToken,
        },
        body: json.encode(body));
    return resp;
  }

  Future<Response> putRequestList(
      String uri, String ext, List<Map> body) async {
    final _url = uri + ext;
    final resp = await http.put(Uri.parse(_url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: localStorage.userToken,
        },
        body: json.encode(body));
    return resp;
  }

  Future getRequest(String uri, String ext) async {
    final _url = uri + ext;
    final resp = await http.get(Uri.parse(_url), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: localStorage.userToken,
    });
    final int statusCode = resp.statusCode;
    if (statusCode < 200 || statusCode > 399) {
      return statusCode;
    }
    final decodedData = json.decode(resp.body);
    return decodedData;
  }

  Future deleteRequest(String uri, String ext) async {
    final _url = uri + ext;
    final resp = await http.delete(Uri.parse(_url), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: localStorage.userToken,
    });
    final int statusCode = resp.statusCode;
    if (statusCode < 200 || statusCode > 399) {
      return statusCode;
    }
    final decodedData = json.decode(resp.body);
    return decodedData;
  }

  Future getIdentificadorFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final identificador = prefs.getString("Identificador");
    return identificador;
  }
}
