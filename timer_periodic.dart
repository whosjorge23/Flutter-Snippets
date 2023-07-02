var counter = 3;
Timer.periodic(const Duration(seconds: 2), (timer) {
  print(timer.tick);
  counter--;
  if (counter == 0) {
    print('Cancel timer');
    timer.cancel();
  }
});
// Outputs:
// 1
// 2
// 3
// "Cancel timer"
