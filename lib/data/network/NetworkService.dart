import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:provider_mvvm_state_management/data/app_exception.dart';
import 'package:provider_mvvm_state_management/data/network/BaseNetworkService.dart';
import 'package:http/http.dart' as http;

class NetworkServic extends BaseNetworkService {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occurred while communicating with server with status code ${response.statusCode.toString()}");
    }
  }
}
