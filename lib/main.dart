import 'package:dspace/widgets/tab.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'function/functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Use normal scaffold and use pageview(Might not be possible) in base scaffold
  /// Don' include empty dir
  /// use isolate on stream for the listing of dir
  ///
  List dir = [];

  @override
  void initState() {
    _();
    super.initState();
    // Future.microtask(() => null)
  }

  void _() async {
    //compute(await dirs(), '/');
    dir = await compute(dirs, (await home()).toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // showPerformanceOverlay: true,
        //initialRoute: 'Table',
        title: 'Dspace',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Tabletest(
          datasource: dir,
        ));
  }
}
