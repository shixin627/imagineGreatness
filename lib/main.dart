import 'package:flutter/material.dart';
import 'package:hello_world/data/imageSource.dart';
import 'package:hello_world/locator.dart';
import 'package:hello_world/models/imageCube.dart';
import 'package:hello_world/services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Classroom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
      navigatorKey: locator<NavigationService>()
          .navigatorKey, // 使用GlobalKey<NavigatorState>，或取現在
      onGenerateRoute:
          doGenerateRoute, // 以當前的RouteSettings來決定現在的頁面Route<dynamic>
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool layout = true;
  List<String> imageAssets;
  List<Widget> _list;

  @override
  void initState() {
    super.initState();
    imageAssets = ImageSource.assets;
    _list = List.generate(
        imageAssets.length,
        (index) => ImageCube(
              Image.asset(imageAssets[index]),
              sideLength: 120,
            ));
  }

  void _transformLayout() {
    setState(() {
      layout = !layout;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: 
          Wrap(
            direction: layout ? Axis.horizontal : Axis.vertical,
            children: _list,
          ),
          // layout
          //     ? Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: _list,
          //       )
          //     : Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: _list,
          //       ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _transformLayout,
          tooltip: 'transform',
          child: Icon(Icons.transform),
        ),
      ),
    );
  }
}
