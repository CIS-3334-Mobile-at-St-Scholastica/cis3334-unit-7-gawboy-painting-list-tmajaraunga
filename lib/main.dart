import 'dart:ui';
import 'package:flutter/material.dart';
import 'load_painting_info.dart';
import 'painting_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Gawboy Paintings'),
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
  List<PaintingInfo> gawboyPaintings = []; // the list of paintings
  LoadPaintingInfo paintLoader = LoadPaintingInfo();

  // Controller for the PageView
  final PageController ctrl = PageController();

  // Load the painting information when the app starts
  @override
  void initState() {
    super.initState(); // It's good practice to call super.initState() first
    gawboyPaintings = paintLoader.InitInCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // Use PageView.builder to create a swipeable list of pages
      body: PageView.builder(
        controller: ctrl,
        itemCount: gawboyPaintings.length,
        itemBuilder: (BuildContext context, int position) {
          // Get the painting for the current page
          final painting = gawboyPaintings[position];

          // Return a widget for the page's content
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Display the painting image
                // Make sure you have an 'assets/images/' folder in your project root
                // and have added it to pubspec.yaml
                Image.asset('assets/images/' + painting.imageFile),
                const SizedBox(height: 16), // Spacer

                // Display the painting name
                Text(
                  painting.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8), // Spacer

                // Display the painting description
                Text(
                  painting.gawboyDescription,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
