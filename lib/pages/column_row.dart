import 'package:flutter/material.dart';
import 'package:hello_world/data/imageSource.dart';
import 'package:hello_world/models/imageCube.dart';

class MyColumnRow extends StatefulWidget {
  MyColumnRow({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyColumnRowState createState() => _MyColumnRowState();
}

class _MyColumnRowState extends State<MyColumnRow> {
  bool layout = false;
  List<String> imageAssets;
  List<Widget> _list; // ex: Text. Image. Icon ...

// 程式開始的位置
  @override
  void initState() {
    super.initState();
    print(imageAssets); //null
    imageAssets = ImageSource.assets;
    print(
        imageAssets); //[assets/images/Dash.png, assets/images/born-to-hot-reload.jpg, assets/images/dash-facing-front.png]
    _list = List.generate(
        3, //length
        (index) => ImageCube(
              Image.asset(imageAssets[index]), // Image.asset("路徑")
              sideLength: 150,
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
              // layout //true
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
