import 'package:flutter/material.dart';

class WorldMapPage extends StatefulWidget {
  @override
  _WorldMapPageState createState() => _WorldMapPageState();
}

class _WorldMapPageState extends State<WorldMapPage> {
  final TransformationController _transformationController = TransformationController();
  double _scale = 1.0;

  void _zoomIn() {
    setState(() {
      _scale += 0.5;
      _transformationController.value = Matrix4.diagonal3Values(_scale, _scale, 1.0);
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = (_scale - 0.5).clamp(0.5, 6.0);
      _transformationController.value = Matrix4.diagonal3Values(_scale, _scale, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World Map'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InteractiveViewer(
              transformationController: _transformationController,
              boundaryMargin: EdgeInsets.all(20.0),
              minScale: 0.5,
              maxScale: 6.0,
              child: Image.asset('assets/images/world_map.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _zoomIn,
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: _zoomOut,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}