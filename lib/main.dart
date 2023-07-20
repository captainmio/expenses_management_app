import 'package:expenses_management_app/constants/page_lists.dart';
import 'package:expenses_management_app/provider_models/provider_page_model.dart';
import 'package:expenses_management_app/screens/home.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'constants/theme_color.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ProviderPageModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final providerPageModel = Provider.of<ProviderPageModel>(context);

    return MaterialApp(
      home: screens[providerPageModel.currentIndex],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customAmberColorSwatch,
      ),
    );
  }
}
