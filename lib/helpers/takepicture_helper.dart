import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import '../screens/registro_screen.dart';

class TakenPicture extends StatefulWidget {
  final CameraDescription camera;

  TakenPicture({Key? key, required this.camera}) : super(key: key);

  @override
  State<TakenPicture> createState() => _TakenPictureState();
}

class _TakenPictureState extends State<TakenPicture> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState(){
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium);
      _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Take a picture',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> RegiScreen()));
              }, icon: const Icon(Icons.arrow_back))
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: ((context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return CameraPreview(_controller);
            }
            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()async {
              try{
                await _initializeControllerFuture;
                final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> RegiScreen(
                      imagePath: path
                      )
                  )
                );
              }
              catch(e){
                print(e);
              }
            },
            child: const Icon(Icons.camera_alt),
          ),
    );
  }
}