import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:moor_test1/app_database.dart';
import 'package:moor_test1/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AppDatabase>(
            create: (_) => AppDatabase(),
            dispose: (_, service) => service.close(),
          ),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: NewOrder(),
      ),
    );
  }
}
