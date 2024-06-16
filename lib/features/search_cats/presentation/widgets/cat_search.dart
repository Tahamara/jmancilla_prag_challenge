import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pragma_jmancilla/core/CatColors.dart';
import '../blocs/cat_bloc/cat_bloc.dart';

class CatSearch extends StatelessWidget {
  const CatSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Platform.isIOS
          ? CupertinoSearchTextField(
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: CatsColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              placeholder: 'Busque por nombre',
              onChanged: (name) {
                context.read<CatBloc>().add(CatsFiltered(name));
              },
            )
          : TextField(
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: CatsColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              decoration: const InputDecoration(
                labelText: 'Nombre',
                hintText: 'Busque por nombre',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (name) {
                context.read<CatBloc>().add(CatsFiltered(name));
              },
            ),
    );
  }
}
