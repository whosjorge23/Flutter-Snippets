GestureDetector(
  onTap: () {
    FocusManager.instance.primaryFocus?.unfocus();
  },
  child: Scaffold(
    appBar: AppBar(
      title: const Text('Close Keyboard Demo'),
      backgroundColor: Color(0xff6ae792),
    ),
    body: ...
  ),
);
