import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todoz/pages/add_page.dart';
import 'package:todoz/pages/home_page.dart';
import 'package:todoz/providers/todo_provider.dart';

void main() {
  /* DON'T FORGET TO ADD THIS LINE!! */
  runApp(ChangeNotifierProvider(
      create: (context) => TodoProvider(), child: MyApp()));
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => AddPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
