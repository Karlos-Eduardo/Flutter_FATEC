import 'package:flutter/material.dart';

buildTextFormField(label, variavel, {flotLabel = true, maxLines=true, maxLength=false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      maxLength: (maxLength == false) ? null : 40,
      maxLines: (maxLines == true) ? 1 : null,
      controller: variavel,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)),
        labelText: '$label',
        floatingLabelBehavior: (flotLabel == true)
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.auto,
        labelStyle: const TextStyle(color: Colors.black),
        focusColor: Colors.white,
        border: const OutlineInputBorder(),
      ),
    ),
  );
}
