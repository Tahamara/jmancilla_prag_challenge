import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pragma_jmancilla/core/CatColors.dart';
import 'package:pragma_jmancilla/features/search_cats/data/datasources/remote_data_source.dart';
import 'package:pragma_jmancilla/features/search_cats/data/repositories/cat_repository_impl.dart';
import 'package:pragma_jmancilla/features/search_cats/domain/entities/cat.dart';
import 'package:pragma_jmancilla/features/search_cats/domain/usecases/get_cat_image_url.dart';
import 'package:pragma_jmancilla/features/search_cats/presentation/blocs/image_bloc/image_bloc.dart';
import 'package:pragma_jmancilla/features/search_cats/presentation/views/cat_detail.dart';

class CatCard extends StatelessWidget {
  final Cat cat;

  CatCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageBloc(
          getImageUrl: GetCatImage(CatRepositoryImpl(
              remoteDataSource: CatRemoteDataSourceImpl(dio: Dio()))))
        ..add(FetchImage(cat.referenceImageId!)),
      child: Card(
        key: UniqueKey(),
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${cat.name}',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: CatsColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 4.0),
              BlocListener<ImageBloc, ImageState>(
                listener: (context, state) {
                  // if (state is ImageLoaded) {
                  //   CachedNetworkImage.evictFromCache(state.imageUrl);
                  // }
                },
                child: BlocBuilder<ImageBloc, ImageState>(
                  builder: (context, state) {
                    if (state is ImageLoading) {
                      return const SizedBox(
                          height: 400,
                          child: Center(child: CircularProgressIndicator()));
                    } else if (state is ImageLoaded) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailView(
                                cat: cat,
                                imageUrl: state.imageUrl,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'item-${cat.id}',
                          child: CachedNetworkImage(
                            key: ValueKey(state.imageUrl),
                            imageUrl: state.imageUrl,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            height: 400,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else if (state is ImageError) {
                      return const Icon(Icons.error);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Pais de origen: ${cat.origin}',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CatsColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Inteligencia: ${cat.intelligence} ',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CatsColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
