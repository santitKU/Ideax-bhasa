import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  final AudioCache audioCache = AudioCache();
  @override
  void initState() {
    super.initState();
    loadmodel();
  }

  detect_image(File image) async {
    var prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 4,
        threshold: 0.0001,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _loading = false;
      _predictions = prediction!;
      print(_predictions);
    });
  }

  bool _loading = true;
  late File _image;
  final imagePicker = ImagePicker();
  List _predictions = [];

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  _loadimagefromgallery() async {
    var image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detect_image(_image);
  }

  _loadimagefromcamera() async {
    var image = await imagePicker.pickImage(source: ImageSource.camera);

    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detect_image(_image);
  }

  AudioPlayer audioPlayer = AudioPlayer();
  Widget build(BuildContext context) {
    Future<void> playAudio() async {
      // onPressed: () => AudioPlayer().play(AssetSource('audio/my_audio.mp3'));
    }

    @override
    void dispose() {
      audioPlayer
          .dispose(); // Dispose of the audio player when the widget is removed
      super.dispose();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 200,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 243, 241, 241)),
                width: double.infinity,
                child: Center(
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.grey),
                      child: Center(
                        child: Image.asset("assets/BHASA4.png"),
                      )),
                )),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _loadimagefromgallery();
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 119, 118, 118),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Center(child: Text('Check with Image')),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                _loadimagefromcamera();
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 119, 118, 118),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Center(child: Text('Check with Camera')),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _loading == false
                ? Column(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        child: Image.file(_image),
                      ),
                      // print(_predictions[0]['label'].toString().substring(1));
                      // if (_predictions[0]['label'].toString().substring(1) ==
                      //     "फूल")
                      //   Column(
                      //     children: [

                      //       Text("Flower"),
                      //       // Other widgets you want to include when the condition is met
                      //     ],
                      //   )
                      //   else
                      //   Column(
                      //     children: [
                      //       Text("Not Flower"),
                      //       // Other widgets you want to include when the condition is met
                      //     ],
                      //   )
                      if (_predictions[0]['label'].toString() == "लाखे")
                        Container(
                          height: 200,
                          width: 200,
                          child: Text("आंखि झ्या:",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 45)),
                        )
                      else if (_predictions[0]['label'].toString() ==
                          "आंखि झ्या:")
                        Container(
                          height: 200,
                          width: 200,
                          child: Center(
                            child: Text(
                              "आंखि झ्या:",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 45),
                            ),
                          ),
                        )
                      else
                        Container(
                          height: 200,
                          width: 200,
                          child: Text(
                            "स्वां",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 45),
                          ),
                        ),

                      // Text(_predictions[0]['label'].toString().substring(1)),
                      // Text(
                      //     'Confidence ${_predictions[0]['confidence'].toString().substring(2, 4)}.${_predictions[0]['confidence'].toString().substring(4, 6)}%'),
                      // const SizedBox(
                      //   height: 12,
                      // ),
                    ],
                  )
                : const Icon(Icons.error_outline),
          ],
        ),
      ),
    );
  }
}
