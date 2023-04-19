if (latLngValue != null) {
  // positionsArray.add(latLngValue!);
  // print("ArrayPositions ${positionsArray.length}");

  if (!positionsArray.contains(latLngValue)) {
    if (positionsArray.length < 10) {
      positionsArray.add(latLngValue!);
    } else {
      positionsArray.removeAt(0);
      positionsArray.add(latLngValue!);
    }
    print("ArrayPositions ${positionsArray.length}");
  }
}
