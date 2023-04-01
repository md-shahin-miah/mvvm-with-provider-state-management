import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_mvvm_state_management/utils/utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: TextButton(
        child: const Text("This is Home"),
        onPressed: () {

          Utils.showToast("Toast testing ");
          Utils.showFlushBar("Flushbar testing ",context);
        },
      )),
    );
  }
}
