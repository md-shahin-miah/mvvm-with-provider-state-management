import 'package:flutter/cupertino.dart';
import 'package:provider_mvvm_state_management/repository/auth_repository.dart';
import 'package:provider_mvvm_state_management/utils/routes/routes_name.dart';
import 'package:provider_mvvm_state_management/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final _myAuthRepo = AuthRepository();

  bool isLoading=false;

  bool get getIsLoading => isLoading;

   setIsLoading( bool val){
    isLoading=val;
    notifyListeners();
  }



  Future<dynamic> loginData(dynamic data, BuildContext buildContext) async {

    setIsLoading(true);

    _myAuthRepo.getLoginData(data).then((value) {
      Utils.showFlushBar("Success", buildContext);
      setIsLoading(false);

      Navigator.pushReplacementNamed(buildContext, RoutesName.home);

    }).onError((error, stackTrace) {
      Utils.showFlushBar(error.toString(), buildContext);
      setIsLoading(false);

    });
  }
}
