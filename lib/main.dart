import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_api/screens/home.dart';
import 'package:sample_api/services/user_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserApi()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tada',
        home: HomePage(),
      ),
    );
  }
}
