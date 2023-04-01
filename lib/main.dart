import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_state_management/utils/routes/routes.dart';
import 'package:provider_mvvm_state_management/utils/routes/routes_name.dart';
import 'package:provider_mvvm_state_management/view/screens/login_screen.dart';
import 'package:provider_mvvm_state_management/view/screens/my_home_page.dart';
import 'package:provider_mvvm_state_management/view_model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (_)=>AuthViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoutes,
        home: const LoginScreen(),
      ),
    );
  }
}
