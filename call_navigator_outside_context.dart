  goToScreen() {
    // Navigator.popAndPushNamed(context, "/screenName");
    Navigator.pop(context);
  }

 void startTimer() {
    var minutes = getMinutesLive("regular");
    _timer = Timer.periodic(minutes, (timer) {
      // Do something every minute
      print("One minute has passed.");
      goToSnapshot();
      stopTimer();
    });
  }
