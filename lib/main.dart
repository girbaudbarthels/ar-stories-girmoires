import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter_sound/flutter_sound.dart';
import 'texts.dart' as getText;
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  VideoPlayerController _controller;

  var neud;
  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  String textIntro = 'Welkom bij Girmoires.';
  bool begin = true;
  bool subtitle = true;
  bool drumVid = false;
  String subs = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mPlayer.openAudioSession();

    _controller = VideoPlayerController.asset('assets/images/10.MP4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            ARKitSceneView(
              detectionImagesGroupName: 'AR Resources',
              enablePinchRecognizer: true,
              enablePanRecognizer: true,
              enableRotationRecognizer: true,
              onARKitViewCreated: (c) {
                c.onUpdateNodeForAnchor = (weo) {
                  final pos = vector.Vector3(
                      weo.transform.getColumn(3).x,
                      weo.transform.getColumn(3).y,
                      weo.transform.getColumn(3).z);
                  if (weo is ARKitImageAnchor) {
                    switch (weo.referenceImageName) {
                      case '1':
                        drawImage('1', pos, c);

                        break;
                      case '2':
                        drawImage('2', pos, c);

                        break;
                      case '3':
                        drawImage('3', pos, c);

                        break;
                      case '4':
                        drawImage('4', pos, c);

                        break;
                      case '5':
                        drawImage('5', pos, c);

                        break;
                      case '6':
                        drawImage('6', pos, c);

                        break;
                      case '7':
                        drawImage('7', pos, c);

                        break;
                      case '8':
                        drawImage('8', pos, c);

                        break;
                      case '9':
                        drawImage('9', pos, c);

                        break;
                      case '10':
                        drawImage('10', pos, c);

                        break;
                      case '11':
                        drawImage('11', pos, c);

                        break;
                      case '12':
                        drawImage('12', pos, c);

                        break;
                      case '13':
                        drawImage('13', pos, c);

                        break;
                      case '14':
                        drawImage('14', pos, c);

                        break;
                      case '15':
                        drawImage('15', pos, c);

                        break;
                      case '16':
                        drawImage('16', pos, c);

                        break;
                      default:
                    }
                  }
                };
              },
            ),
            Visibility(
              visible: begin,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        textIntro,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Dit zijn de herinerringen van Girbaud. Tik op de knop om de scanner te starten! Scan de objecten uit de doos.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CupertinoButton(
                      color: Colors.white.withOpacity(0.7),
                      child: Text(
                        'Begin',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7), fontSize: 14),
                      ),
                      onPressed: () {
                        setState(() {
                          textIntro = "Begin";
                          begin = false;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !begin,
              child: Visibility(
                visible: subtitle,
                child: SafeArea(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            subs,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Opacity(
                  opacity: 0.7,
                  child: Container(
                    padding: EdgeInsets.only(right: 20, top: 20),
                    child: FloatingActionButton(
                      child: Icon(Icons.subtitles),
                      backgroundColor: Colors.white.withOpacity(0.7),
                      onPressed: () {
                        setState(() {
                          subtitle = !subtitle;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),

            ///VIDEO
            ///
            Visibility(
              visible: drumVid,
              child: Center(
                  child: Container(
                      height: 150,
                      width: 300,
                      child: VideoPlayer(_controller))),
            ),
          ],
        ),
      ),
    );
  }

  drawImage(String fileName, pos, ARKitController c) {
    play(fileName);

    if (neud != null) {
      c.remove(neud);
    }
    if (fileName == '10') {
      setState(() {
        drumVid = true;
        _controller.play();
      });
    } else {
      setState(() {
        drumVid = false;
        _controller.pause();
        _controller.seekTo(
          Duration(seconds: 0),
        );
      });
      final node = ARKitNode(
        name: fileName,
        geometry: ARKitBox(
          width: 0.08,
          height: 0.08,
          length: 0.08,
          materials: [
            ARKitMaterial(
              diffuse:
                  ARKitMaterialProperty(image: 'assets/images/$fileName.jpg'),
              doubleSided: true,
            ),
          ],
        ),
        position: pos,
      );
      c.add(node);
    }

    setState(() {
      neud = fileName;
    });
  }

  void play(fileName) async {
    print(' ');
    await _mPlayer.startPlayer(
        fromURI: 'https://rvised.com/soundsStories/$fileName.mp3',
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {
            subs = '';
          });
        });
    setState(() {
      subs = getText.TextsAr().text[int.parse(fileName) - 1];
    });
  }
}
