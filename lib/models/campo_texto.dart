//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget campoTexto(rotulo) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 60,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: TextFormField(
            cursorColor: Colors.black,
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              labelText: rotulo,
              labelStyle: TextStyle(color: Colors.white),

              focusColor: Colors.white,
              //prefixIcon: Icon(Icons.email, color: Colors.black),
              border: UnderlineInputBorder(),
            ),
          ),
        ),
      ),
    ],
  );
}
