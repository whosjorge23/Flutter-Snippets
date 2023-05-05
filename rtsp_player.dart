Container buildRTPSPlayer(BuildContext context) {
    return Container(
      height: _isFullScreen ? MediaQuery.of(context).size.height : 400,
      child: Stack(
        fit: StackFit.passthrough, //ADD THIS LINE
        children: [
          widget.url != null
              ? Container(
                  // height:
                  //     _isFullScreen ? MediaQuery.of(context).size.height : 400,
                  child: VlcPlayer(
                    controller: _vlcPlayerController!,
                    aspectRatio:
                        InfoDeviceConstants(context).isTabletLandscape()
                            ? 16 / 10
                            : 16 / 9,
                    placeholder: Center(
                      child: CircularProgressIndicator(
                          color: pixoraTheme.primaryColor),
                    ),
                  ),
                )
              : Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircularProgressIndicator(
                        color: pixoraTheme.primaryColor),
                  ),
                ),
          // Positioned(
          //   top: 10,
          //   right: 10,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.white.withOpacity(0.3),
          //     ),
          //     child: IconButton(
          //       icon: Icon(
          //         Icons.close,
          //         color: Colors.blue,
          //       ),
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //     ),
          //   ),
          // ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.white.withOpacity(0.5),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _isplaying
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            _isplaying = false;
                            _vlcPlayerController?.pause();
                          });
                        },
                        child: const Icon(
                          Icons.pause,
                          size: 30,
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          setState(() {
                            _isplaying = true;
                            _vlcPlayerController?.play();
                          });
                        },
                        child: Icon(
                          Icons.play_arrow,
                          size: 30,
                        ),
                      ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: isVideoLive == false
                        ? Slider(
                            value: playbackValue,
                            max: double.parse(_vlcPlayerController!
                                .value.duration.inSeconds
                                .toString()),
                            onChanged: (value) {
                              setState(() {
                                _vlcPlayerController!
                                    .seekTo(Duration(seconds: value.toInt()));
                              });

                              // setState(() {});
                            })
                        : SizedBox.shrink(),
                    // GestureDetector(
                    //                         onTap: () {
                    //                           isRecording = !isRecording;
                    //                           print("RECORDING $isRecording");
                    //                           if (!isRecording) {
                    //                             widget.addVideoRecording();
                    //                           }
                    //                           setState(() {});
                    //                         },
                    //                         child: Chip(
                    //                           label: Row(
                    //                             children: [
                    //                               Icon(
                    //                                 Icons.camera_outlined,
                    //                                 color: Colors.white,
                    //                               ),
                    //                               Text(
                    //                                 isRecording ? " RECORDING..." : " Record",
                    //                                 style: TextStyle(color: Colors.white),
                    //                               )
                    //                             ],
                    //                           ),
                    //                           backgroundColor: Colors.red,
                    //                         ),
                    //                       ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.toggleFullScreen();
                    setState(() {
                      _isFullScreen = !_isFullScreen;
                      if (_isFullScreen) {
                        enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeRight,
                          DeviceOrientation.landscapeLeft
                        ]);
                      } else {
                        exitFullScreen();
                        SystemChrome.setPreferredOrientations(
                            [DeviceOrientation.portraitUp]);
                      }
                    });
                  },
                  child: Icon(
                    _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                    size: 30,
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
