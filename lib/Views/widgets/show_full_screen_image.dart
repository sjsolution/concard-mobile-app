import 'package:flutter/material.dart';

class ShowFullScreenImage extends StatefulWidget {
 const ShowFullScreenImage({Key? key, required this.images}) : super(key: key);
  final List<String> images;
  @override
  State<ShowFullScreenImage> createState() => _ShowFullScreenImageState();
}

class _ShowFullScreenImageState extends State<ShowFullScreenImage> {
  int currentIndex = 0;
 final _transformationController = TransformationController();
  TapDownDetails? doubleTapDetails;
  void _handleDoubleTapDown(TapDownDetails details) {
    doubleTapDetails = details;
  }
  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = doubleTapDetails!.localPosition;
      // For a 3x zoom
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
      // Fox a 2x zoom
      // ..translate(-position.dx, -position.dy)
      // ..scale(2.0);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme:const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemCount: widget.images.length,
          itemBuilder: (context, position) {
            return Stack(alignment: Alignment.bottomCenter, children: [
              GestureDetector(
                   onTapDown: _handleDoubleTapDown,
                    onTap: _handleDoubleTap,
                child: InteractiveViewer(
                      transformationController: _transformationController,

                  child: Image.network(
                    widget.images[position],
                    fit: BoxFit.contain,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text("${currentIndex + 1} / ${widget.images.length}"),
              )
            ]);
          },
        ));
  }
}
