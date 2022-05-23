import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData? sofixIconData;
  final bool obscureText;
  final Function? onChanged;
  final controller;
  // final validator;

  const TextFieldWidget(
      {Key? key,
      // required this.validator,
      required this.hintText,
      required this.prefixIconData,
      required this.controller,
      this.sofixIconData,
      required this.obscureText,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<HomeModel>(context);

    return TextFormField(
      controller: controller,
      // validator: validator,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: 14,
        color: Color(0xff4A64FE),
      ),
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Colors.grey,
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 167, 37, 1.0),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            // model.isVisible = !model.isVisible;
          },
          child: Icon(
            sofixIconData,
            size: 18,
            color: Color.fromRGBO(255, 167, 37, 1.0),
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
