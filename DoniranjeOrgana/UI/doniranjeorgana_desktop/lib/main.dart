import 'package:doniranjeorgana_desktop/providers/doktor_provider.dart';
import 'package:doniranjeorgana_desktop/providers/korisnik_provider.dart';
import 'package:doniranjeorgana_desktop/providers/korisnik_uloga_provider.dart';
import 'package:doniranjeorgana_desktop/providers/osiguranje_provider.dart';
import 'package:doniranjeorgana_desktop/providers/pacijent_osiguranje_provider.dart';
import 'package:doniranjeorgana_desktop/providers/pacijent_provider.dart';
import 'package:doniranjeorgana_desktop/providers/preventivne_mjere_provider.dart';
import 'package:doniranjeorgana_desktop/providers/specijalizacija_provider.dart';
import 'package:doniranjeorgana_desktop/providers/uloga_provider.dart';
import 'package:doniranjeorgana_desktop/screens/welcome_screen.dart';
import 'package:doniranjeorgana_desktop/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PacijentProvider()),
      ChangeNotifierProvider(create: (_) => SpecijalizacijaProvider()),
      ChangeNotifierProvider(create: (_) => DoktorProvider()),
      ChangeNotifierProvider(create: (_) => KorisnikProvider()),
      ChangeNotifierProvider(create: (_) => PreventivneMjereProvider()),
      ChangeNotifierProvider(create: (_) => OsiguranjeProvider()),
      ChangeNotifierProvider(create: (_) => PacijentOsiguranjeProvider()),
      ChangeNotifierProvider(create: (_) => UlogaProvider()),
      ChangeNotifierProvider(create: (_) => KorisnikUlogaProvider()),
    ],
    child: MyMaterialApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyMaterialApp(),
    );
  }
}

class MyAppBar extends StatelessWidget {
  String? title;
  MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title!);
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RS II Material app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

