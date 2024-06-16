import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pragma_jmancilla/core/CatColors.dart';
import 'package:pragma_jmancilla/features/search_cats/presentation/widgets/cat_card.dart';
import '../blocs/cat_bloc/cat_bloc.dart';

class CatList extends StatefulWidget {
  const CatList({super.key});

  @override
  State<CatList> createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBloc, CatState>(builder: (context, state) {
      switch (state.status) {
        case CatStatus.failure:
          return Center(
              child: Text(
            'No se pudo obtener la información',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: CatsColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ));
        case CatStatus.initial:
          return const Center(child: CircularProgressIndicator());
        case CatStatus.success:
          if (state.cats.isEmpty) {
            return Center(
                child: Text(
              'No se encontraron resultados.',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: CatsColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ));
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return index >= state.cats.length
                  ? const Center(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(strokeWidth: 1.1),
                      ),
                    )
                  : CatCard(key: UniqueKey(), cat: state.cats[index]);
            },
            itemCount:
                state.hasReachedMax ? state.cats.length : state.cats.length + 1,
            controller: _scrollController,
          );

        default:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CatBloc>().add(CatsFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
