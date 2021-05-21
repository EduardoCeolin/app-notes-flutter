import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final description;

  CustomButton({this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context, description);
        },
        child: Text("Salvar"),
      ),
    );
  }
}
