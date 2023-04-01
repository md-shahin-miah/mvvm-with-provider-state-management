import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_state_management/utils/routes/routes_name.dart';
import 'package:provider_mvvm_state_management/utils/utils.dart';
import 'package:provider_mvvm_state_management/view_model/auth_view_model.dart';

import '../widget_components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => StateLoginScreen();
}

class StateLoginScreen extends State<LoginScreen> {
  ValueNotifier<bool> valueNotifierObscure = ValueNotifier<bool>(true);

  final TextEditingController _textEditingControllerEmail =
      TextEditingController();
  final TextEditingController _textEditingControllerPassword =
      TextEditingController();

  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _textEditingControllerPassword.dispose();
    _textEditingControllerEmail.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authViewModel = Provider.of<AuthViewModel>(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: TextFormField(
                  controller: _textEditingControllerEmail,
                  focusNode: _focusNodeEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white)),
                      hintText: "email",
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email)),
                  onFieldSubmitted: (val) {
                    Utils.changeFocusNode(
                        context, _focusNodeEmail, _focusNodePassword);
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ValueListenableBuilder(
                  valueListenable: valueNotifierObscure,
                  builder: (context, val, child) {
                    return TextFormField(
                      controller: _textEditingControllerPassword,
                      focusNode: _focusNodePassword,
                      keyboardType: TextInputType.text,
                      obscureText: val,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.white)),
                          hintText: "password",
                          labelText: "password",
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: InkWell(
                              onTap: () {
                                valueNotifierObscure.value =
                                    !valueNotifierObscure.value;
                              },
                              child: Icon(valueNotifierObscure.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility))),
                      onFieldSubmitted: (val) {
                        // Utils.changeFocusNode(context, _focusNodeEmail, _focusNodePassword);
                      },
                    );
                  },
                ),
              ),
              Consumer<AuthViewModel>(builder: (context,vAuthProvider,child){
                return RoundedButton(
                  loading: vAuthProvider.isLoading,
                    btName: "Log in",
                    onPress: () {

                      if (_textEditingControllerEmail.text.isEmpty) {
                        Utils.showFlushBar("Email field is empty ", context);
                      } else if (_textEditingControllerPassword.text.isEmpty) {
                        Utils.showFlushBar("Password field is empty ", context);
                      } else if (_textEditingControllerPassword.text.length < 6) {
                        Utils.showFlushBar(
                            "Password length is less than 6 ", context);
                      } else {
                        Map data = {
                          "email": _textEditingControllerEmail.text.toString(),
                          "password":
                          _textEditingControllerPassword.text.toString()
                        };

                        authViewModel.loginData(data,context);
                      }

                      print("clicked ronded button");
                    });
              },)
            ],
          ),
        ),
      ),
    );
  }
}
