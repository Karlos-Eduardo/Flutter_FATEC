import 'package:flutter/material.dart';

textAlert(rotulo, value, {aux = 0}) {
  return Row(
    children: [
      Text('$rotulo:', style: const TextStyle(fontSize: 13)),
      if (aux == 1)
        Text('$value', style: const TextStyle(fontSize: 13))
      else
        Text(' ${value.text}', style: const TextStyle(fontSize: 13)),
    ],
  );
}
