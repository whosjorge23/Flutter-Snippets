String truncateString(String value, int maxLength) {
  if (value.length <= maxLength) {
    return value;
  } else {
    return value.substring(0, maxLength - 3) + '...';
  }
}

String longString = 'This is a very long string that needs to be truncated';
String truncated = truncateString(longString, 20);
print(truncated); // Output: "This is a very long..."
