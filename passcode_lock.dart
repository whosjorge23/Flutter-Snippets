class PasscodeScreen extends StatefulWidget {
  @override
  _PasscodeScreenState createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  String passcode = '';

  void _onNumberButtonPressed(int number) {
    setState(() {
      passcode += number.toString();
    });
  }

  void _onSubmitButtonPressed() {
    // Implement your logic for validating the passcode here
    if (passcode == '1234') {
      print('Passcode is correct!');
    } else {
      print('Passcode is incorrect!');
    }

    // Clear the passcode after validation
    setState(() {
      passcode = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passcode Lock'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Passcode:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              passcode,
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(height: 20.0),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: List.generate(9, (index) {
                return Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    child: ElevatedButton(
                      onPressed: () => _onNumberButtonPressed(index + 1),
                      child: Text(
                          (index+1).toString(),
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 120,
                  child: ElevatedButton(
                    onPressed: _onSubmitButtonPressed,
                    child: Text(
                      '=',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 120,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      '*',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
