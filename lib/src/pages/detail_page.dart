import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movil_info_juegos/src/animations/fade_animations.dart';
import 'package:movil_info_juegos/src/widgets/blur_container.dart';
import 'package:movil_info_juegos/src/widgets/requeriment_details.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.color, required this.data});
  final Color color;
  final Map<String, dynamic> data;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double screenHeight = 0;
  double screenWidth = 0;

  Map<String, dynamic> rMinimum = {};
  Map<String, dynamic> rRecommended = {};

  late YoutubePlayerController _controller;

  void setRequeriments() {
    Map<String, dynamic> details = widget.data;
    Map<String, dynamic> rMin = details['requirements']['minimum'];
    Map<String, dynamic> rRec = details['requirements']['recommended'];
    setState(() {
      rMinimum = rMin;
      rRecommended = rRec;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.data['url_video'] ??
              'https://www.youtube.com/watch?v=Xia-MsSgfMM') ??
          '',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    setRequeriments();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: widget.color,
          progressColors: ProgressBarColors(
            playedColor: widget.color,
            handleColor: widget.color,
          ),
        ),
        builder: (context, player) {
          return Scaffold(
              backgroundColor: Colors.black,
              body: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [widget.color, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: SizedBox(
                                  height: screenWidth * 0.42,
                                  child: Hero(
                                      tag: widget.color,
                                      child:
                                          Image.asset(widget.data['cover']))),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            left: 10,
                            child: FadeAnimation(
                              intervalEnd: 0.8,
                              child: BlurContainer(
                                  child: Container(
                                      width: 160,
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white.withOpacity(0.1)),
                                      child: Text(widget.data['name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white)))),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FadeAnimation(
                        intervalStart: 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.data['name'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    widget.data['developer'] ?? '',
                                    style:
                                        const TextStyle(color: Colors.white54),
                                  )
                                ]),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FadeAnimation(
                          intervalStart: 0.15,
                          child: Text(widget.data['description'],
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 15)),
                        )),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, top: 12, bottom: 12),
                      child: Text(
                        'Requisitos Minimos',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    RequirementDetails(data: rMinimum),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, top: 12, bottom: 12),
                      child: Text(
                        'Requisitos Recomendados',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    RequirementDetails(data: rRecommended),
                    const SizedBox(
                      height: 20,
                    ),
                    player,
                  ],
                ),
              ));
        });
  }
}
