InkWell(
  onTap: () {
    // Perform action on button click
    Navigator.pop(context);
  },
  child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.transparent,
    ),
    padding: EdgeInsets.all(8),
    child: Icon(
      Icons.close,
      color: Colors.white,
    ),
  ),
)
