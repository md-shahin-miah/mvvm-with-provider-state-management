import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_mvvm_state_management/utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => StateLoginScreen();
}

class StateLoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, RoutesName.home);

              }, child: Text("Go to Home"))
            ],
          ),
        ),
      ),
    );
  }
}
