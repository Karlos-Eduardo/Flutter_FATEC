import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

buildCard(titu, urg, tamanho) {
  return SizedBox(
    height: tamanho,
    child: Card(
      elevation: 2,
      color: const Color.fromARGB(250, 113, 179, 245),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titu,
            style: GoogleFonts.roboto(fontSize: 20),
          ),
          Text(urg, style: GoogleFonts.roboto()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '#000',
                style: GoogleFonts.roboto(
                    fontSize: 10, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
