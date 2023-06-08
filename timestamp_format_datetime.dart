int timestamp = 1685611800000; // Replace with your timestamp

DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
String formattedDateTime = "${dateTime.year}/${_addLeadingZero(dateTime.month)}/${_addLeadingZero(dateTime.day)} ${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}";

String _addLeadingZero(int value) {
  return value.toString().padLeft(2, '0');
}

print(formattedDateTime);
