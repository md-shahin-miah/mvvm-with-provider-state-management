import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String btName;
  bool loading;
  final VoidCallback onPress;

  RoundedButton(
      {Key? key,
      required this.btName,
      this.loading = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.all(4),
          height: 40,
          width: 200,
          color: Colors.orange,
          child: !loading
              ? Center(
                  child: Text(
                  btName,
                  style: const TextStyle(color: Colors.white),
                ))
              : const Center(
                  child: CircularProgressIndicator(color: Colors.red)),
        ),
      ),
    );
  }
}
