class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Text("Widget 1"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Text("Widget 2"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: Text("Widget 3"),
              ),
            ],
          ),
          Visibility(
            visible: _selectedIndex == 0,
            child: Container(
              child: Text("Widget 1 content"),
            ),
          ),
          Visibility(
            visible: _selectedIndex == 1,
            child: Container(
              child: Text("Widget 2 content"),
            ),
          ),
          Visibility(
            visible: _selectedIndex == 2,
            child: Container(
              child: Text("Widget 3 content"),
            ),
          ),
        ],
      ),
    );
  }
}
