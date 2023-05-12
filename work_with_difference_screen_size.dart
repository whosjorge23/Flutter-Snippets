import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoDeviceConstants {
  BuildContext context;
  InfoDeviceConstants(this.context) : assert (context != null);
  double get shortestSide => MediaQuery.of(context).size.shortestSide;
  Enum get deviceOrentation => MediaQuery.of(context).orientation;


  bool isMobile() {
    if (shortestSide < 600){
      return true;
    }else{
      return false;
    }
  }

  bool isTabletLandscape() {
    if (deviceOrentation == Orientation.landscape){
      return true;
    }else{
      return false;
    }
  }

	bool isTabletPortrait() {
    if (deviceOrentation == Orientation.portrait){
      return true;
    }else{
      return false;
    }
  }

  void portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void allModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void landscapeModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
