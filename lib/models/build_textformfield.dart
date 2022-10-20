import 'package:flutter/material.dart';

buildTextFormField(label, variavel) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: variavel,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)),
        labelText: '$label',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(color: Colors.black),
        focusColor: Colors.white,
        border: const OutlineInputBorder(),
      ),
    ),
  );
}
