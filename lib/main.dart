import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bondy/src/pages/page_time.dart';
import 'package:test_bondy/src/providers/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderTime()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageTime(),
      ),
    );
  }
}
