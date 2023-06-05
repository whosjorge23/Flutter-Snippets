ElevatedButton(
  onPressed: () {},
  child: Text(
    "Click",
    style: TextStyle(fontSize: 20),
  ),
  style: ButtonStyle(
    backgroundColor:
      MaterialStateProperty.all<Color>(Colors.red),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius:
            BorderRadius.circular(4.0),
      ),
    ),
  ),
),
