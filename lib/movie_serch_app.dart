import 'package:flutter/material.dart';
import 'package:movie_search/config/routes/routes.dart';
import 'package:movie_search/presentation/pages/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
