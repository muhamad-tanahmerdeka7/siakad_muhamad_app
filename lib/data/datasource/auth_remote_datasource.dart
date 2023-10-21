import 'package:dartz/dartz.dart';
import 'package:flutter_muhamad_app_siakad/common/constants/variable.dart';
import 'package:flutter_muhamad_app_siakad/data/datasource/auth_local_datasource.dart';
import 'package:flutter_muhamad_app_siakad/data/models/request/auth_request_model.dart';
import 'package:flutter_muhamad_app_siakad/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      AuthRequestModel requestModel) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: headers,
      body: requestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }

  //Versi logout
  Future<Either<String, String>> logout() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${await AuthLocalDatasource().getToken()}',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return const Right('logout successfully');
    } else {
      return const Left('server error');
    }
  }
}
