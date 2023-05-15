import 'dart:math';

import 'package:eom_parinaz_asghari_sample/database/app_database.dart';
import 'package:eom_parinaz_asghari_sample/di/di_setup.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/user_entity.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/vote_entity.dart';
import 'package:eom_parinaz_asghari_sample/local_db/data/model/user_hive_model.dart';
import 'package:eom_parinaz_asghari_sample/local_db/data/model/vote_hive_model.dart';
import 'package:eom_parinaz_asghari_sample/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserHiveModelAdapter());
  Hive.registerAdapter(VoteHiveAdapter());
  configureDependencies();
   // await  $FloorAppDatabase.databaseBuilder('app_database.db').build();

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:LoginPage()
    );
  }
}



