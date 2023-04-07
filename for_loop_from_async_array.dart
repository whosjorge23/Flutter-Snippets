final results = await someAsyncOperation();
for (final value in results) {
  final processedValue = await someAsyncProcessing(value);
  print(processedValue);
}
