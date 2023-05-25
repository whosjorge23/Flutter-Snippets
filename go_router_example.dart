import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => MaterialPage(
            key: state.key,
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: '/details',
          pageBuilder: (context, state) => MaterialPage(
            key: state.key,
            child: DetailsPage(),
          ),
        ),
      ],
    );

    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/details'),
          child: Text('Go to Details'),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
