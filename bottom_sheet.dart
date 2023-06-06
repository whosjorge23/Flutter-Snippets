void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        // Customize the bottom sheet UI as needed
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Bottom Sheet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text('This is a bottom sheet.'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Perform action on button click
                },
                child: Text('Button'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
