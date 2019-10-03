import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  Icon fieldIcon;
  String hintText;
  final Function onPress;

  CustomInputField(this.fieldIcon, this.hintText, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Color.fromRGBO(88, 85, 214, 0.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          child: TextField(
              style: TextStyle(color: Colors.white, fontFamily: 'Consolas'),
              decoration: InputDecoration(
                hasFloatingPlaceholder: true,
                prefixIcon: fieldIcon,
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontFamily: 'Consolas'),
              ),
              onChanged: this.onPress),
        ),
      ),
    );
  }
}
