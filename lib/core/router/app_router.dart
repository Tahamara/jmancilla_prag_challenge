import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_jmancilla/features/search_cats/domain/entities/cat.dart';
import 'package:pragma_jmancilla/features/search_cats/presentation/views/cat_detail.dart';
import 'package:pragma_jmancilla/features/search_cats/presentation/views/cat_page.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return CatPage();
      },
      routes: <GoRoute>[
        GoRoute(
          path: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            return DetailView(
              cat: Cat(),
              imageUrl: '',
            );
          },
        ),
      ],
    ),
  ],
);
