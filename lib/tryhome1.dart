import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';




class TryHome1 extends StatefulWidget {
  const TryHome1({super.key});

  @override
  State<TryHome1> createState() => _TryHome1State();
}

class _TryHome1State extends State<TryHome1> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraController cameraController;
  late CameraImage cameraImage;
  late List recognitionsList = [];

  late List<CameraDescription> cameraList;

  initCamera() {
    availableCameras().then((result) {
      setState(() {
        cameraList = result;
        cameraController = CameraController(cameraList[0], ResolutionPreset.medium);
        cameraController.initialize().then((value) {
          setState(() {
            cameraController.startImageStream((image) {
              cameraImage = image;
              runModel();
            });
          });
        });
      });
    });
  }


  runModel() async {
    recognitionsList = (await Tflite.detectObjectOnFrame(
      bytesList: cameraImage.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: cameraImage.height,
      imageWidth: cameraImage.width,
      imageMean: 127.5,
      imageStd: 127.5,
      numResultsPerClass: 1,
      threshold: 0.4,
    ))!;

    setState(() {
      cameraImage;
    });
  }

  Future loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    super.dispose();

    cameraController.stopImageStream();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();

    loadModel();
    initCamera();
  }

  List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
    if (recognitionsList == null) return [];

    double factorX = screen.width;
    double factorY = screen.height;

    Color colorPick = Colors.pink;

    return recognitionsList.map((result) {
      return Positioned(
        left: result["rect"]["x"] * factorX,
        top: result["rect"]["y"] * factorY,
        width: result["rect"]["w"] * factorX,
        height: result["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['detectedClass']} ${(result['confidenceInClass'] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> list = [];

    list.add(
      Positioned(
        top: 0.0,
        left: 0.0,
        width: size.width,
        height: size.height - 100,
        child: SizedBox(
          height: size.height - 100,
          child: (!cameraController.value.isInitialized)
              ? Container()
              : AspectRatio(
            aspectRatio: cameraController.value.aspectRatio,
            child: CameraPreview(cameraController),
          ),
        ),
      ),
    );

    list.addAll(displayBoxesAroundRecognizedObjects(size));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.only(top: 50),
          color: Colors.black,
          child: Stack(
            children: list,
          ),
        ),
      ),
    );
  }
}