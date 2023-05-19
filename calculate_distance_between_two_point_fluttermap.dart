import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

LatLng? anchorPosition;
LatLng? lastBoatPosition;

Marker(
  width: 80.0,
  height: 80.0,
  point: latLng.markerPosition,
  builder: (ctx) => Container(
    child: Transform.rotate(
      angle: 0,
      child: isLast ? buildBoatMarker() : builOldPositionMarker(),
    ),
  ),
),

PopupMarkerLayerOptions(
  // Existing options...
  popupBuilder: (BuildContext context, Marker marker) {
    // Existing code...
    final distance = calculateDistance();
    return Visibility(
      // Existing code...
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Existing code...
              Text("Distance to Anchor: $distance meters"),
            ],
          ),
        ),
      ),
    );
  },
),

Future<double> calculateDistance() async {
  if (anchorPosition == null || lastBoatPosition == null) {
    return 0.0; // Handle the case when positions are not available
  }

  final distance = await Geolocator.distanceBetween(
    anchorPosition!.latitude,
    anchorPosition!.longitude,
    lastBoatPosition!.latitude,
    lastBoatPosition!.longitude,
  );

  return distance;
}
