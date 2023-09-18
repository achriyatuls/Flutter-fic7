import 'package:dartz/dartz.dart';
import 'package:payment/data/models/auth_response_model.dart';
import 'package:payment/data/models/request/register_request_model.dart';
import 'package:payment/data/models/request/login_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:payment/common/global_variabels.dart';
import 'package:payment/data/datasources/auth_local_datasource.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel model) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final response = await http.post(
      Uri.parse('${GlobalVariabels.baseUrl}/api/register'),
      headers: headers,
      body: model.toJson(),
    );
    // ignore: avoid_print
    print(response);

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('OK-benar');
    }
  }
}

Future<Either<String, AuthResponseModel>> login(LoginRequestModel model) async {
  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  final response = await http.post(
      Uri.parse('${GlobalVariabels.baseUrl}/api/login'),
      headers: headers,
      body: model.toJson());

  if (response.statusCode == 200) {
    return Right(AuthResponseModel.fromJson(response.body));
  } else {
    //final obj = jsonDecode(response.body);
    //return Left(obj['message']);
    return const Left('ERROR');
  }
}

Future<Either<String, String>> logout() async {
  final token = await AuthLocalDatasource().getToken();
  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  final response = await http.post(
    Uri.parse('${GlobalVariabels.baseUrl}/api/logout'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    return const Right('logout success');
  } else {
    return const Left('Server error');
  }
}
