import 'dart:convert';

import 'package:http/http.dart';
import 'package:umami/core/db/user_db.dart';
import 'package:umami/core/entities/user/user_entity.dart';
import 'package:umami/core/models/http/data-reponse_model.dart';
import 'package:umami/providers/repositories_providers.dart';

class AuthenticationRepository {
  EUser? eUser;
  Future<DataResponse<EUser>> login(Map<String, dynamic> serialized) async {
    RepositoryProvider _repositoryProvider = RepositoryProvider();
    final response = await _repositoryProvider.postRequestWithStatusCode(
        RepositoryProvider.uriAPI, "/login", serialized);
    print(response.body);

    dataResponseFromJson(String body) {
      final dataResponse = dataResponseFromJson(response.body);
      this.eUser = dataResponse.eUser;
    }

    return DataResponse();
  }

  Future<DataResponse<EUser>> register(Map<String, dynamic> serialized) async {
    RepositoryProvider _repositoryProvider = RepositoryProvider();
    final response = await _repositoryProvider.postRequestWithStatusCode(
        RepositoryProvider.uriAPI, "/login/new", serialized);
    print(response.body);

    dataResponseFromJson(String body) {
      final dataResponse = dataResponseFromJson(response.body);
      this.eUser = dataResponse.eUser;
    }

    //return DataResponse();

    final respBody = jsonDecode(response.body);

    return DataResponse();
  }
}
