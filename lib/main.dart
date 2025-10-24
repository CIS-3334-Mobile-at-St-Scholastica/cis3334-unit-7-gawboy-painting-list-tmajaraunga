import 'dart:ui';
import 'package:flutter/material.dart';
import 'load_painting_info.dart';
import 'painting_info.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Gawboy Painting'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ==========================================================================
class _MyHomePageState extends State<MyHomePage> {

  List<PaintingInfo> gawboyPaintings = [];                // the list of paintings
  LoadPaintingInfo paintLoader = LoadPaintingInfo();

  // Load the painting information when the app starts
  @override
  void initState() {
    gawboyPaintings = paintLoader.InitInCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: const Text( "Display painting and its name and title here"),
        ),
      ),
    );
  }
}