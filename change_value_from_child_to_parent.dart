class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String _value = "initial value";

  void _updateValue(String newValue) {
    setState(() {
      _value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Value: $_value"),
        ChildWidget(onUpdateValue: _updateValue),
      ],
    );
  }
}

class ChildWidget extends StatelessWidget {
  final Function(String) onUpdateValue;

  const ChildWidget({Key? key, required this.onUpdateValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onUpdateValue("new value");
      },
      child: Text("Update value"),
    );
  }
}
