import 'package:provider_mvvm_state_management/data/network/NetworkService.dart';
import 'package:provider_mvvm_state_management/utils/app_urls.dart';

import '../data/network/BaseNetworkService.dart';

class AuthRepository {
  BaseNetworkService baseNetworkService = NetworkService();

  Future<dynamic> getLoginData(dynamic data) async {
    try {
      dynamic response =
          await baseNetworkService.postApiResponse(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      print("AUTH REPO ERROR "+ e.toString());
      throw e;
    }
  }
}
