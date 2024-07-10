import 'package:flutter/material.dart';
import 'package:mwsproducts/provider.dart';
import 'package:provider/provider.dart';
import 'package:mwsproducts/homePage.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MWS Products'),
        ),
        body: HomePage(),
      ),
    );
  }
}
