// @dart=2.9
import 'package:cozy/providers/space_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/splash_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}
