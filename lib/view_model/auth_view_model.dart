import 'package:flutter/cupertino.dart';
import 'package:provider_mvvm_state_management/repository/auth_repository.dart';
import 'package:provider_mvvm_state_management/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final _myAuthRepo = AuthRepository();

  Future<dynamic> loginData(dynamic data, BuildContext buildContext) async {
    _myAuthRepo.getLoginData(data).then((value) {
      Utils.showFlushBar("Success", buildContext);
    }).onError((error, stackTrace) {
      Utils.showFlushBar(error.toString(), buildContext);
    });
  }
}
