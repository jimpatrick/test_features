import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MaterialApp.router(routerConfig: router));

/// This handles '/' and '/details'.
final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => Scaffold(
        appBar: AppBar(title: const Text('Home Screen')),
        body: Builder(
          builder: (context) {
            return Center(
              child: ElevatedButton(
                  onPressed: () => context.push('/details'),
                  child: const Text('Go to details page!')),
            );
          },
        ),
      ),
    ),
    GoRoute(
      path: '/details',
      builder: (_, __) => Scaffold(
        appBar: AppBar(title: const Text('Details Screen')),
        body: const Center(
          child: Text('You are in details page'),
        ),
      ),
    )
  ],
);
