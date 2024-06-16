import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pragma_jmancilla/core/CatColors.dart';
import 'package:pragma_jmancilla/features/search_cats/data/datasources/remote_data_source.dart';
import 'package:pragma_jmancilla/features/search_cats/data/repositories/cat_repository_impl.dart';
import 'package:pragma_jmancilla/features/search_cats/domain/usecases/get_cats.dart';
import '../../domain/usecases/filter_cats.dart';
import '../blocs/cat_bloc/cat_bloc.dart';
import '../widgets/cat_list.dart';
import '../widgets/cat_search.dart';

class CatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CatsColors.backgroundBlue,
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              middle: Text(
                'Catbreeds',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: CatsColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          : AppBar(
              backgroundColor: CatsColors.blueLight,
              centerTitle: true,
              elevation: 0,
              title: Text(
                'Catbreeds',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: CatsColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocProvider(
          create: (context) => CatBloc(
              getCats: GetCats(CatRepositoryImpl(
                  remoteDataSource: CatRemoteDataSourceImpl(dio: Dio()))),
              filterCats: FilterCats(CatRepositoryImpl(
                  remoteDataSource: CatRemoteDataSourceImpl(dio: Dio()))))
            ..add(CatsFetched()),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CatSearch(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CatList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
