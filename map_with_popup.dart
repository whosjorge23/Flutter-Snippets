import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';


late MapController mapController;
late PopupController popupController;

FlutterMap(
  mapController: mapController,
  options: MapOptions(
      center: positionsArray.last,
      zoom: 16.0,
      minZoom: 3.0,
      maxZoom: 18.25,
      pinchZoomWinGestures: MultiFingerGesture.none,
      pinchMoveWinGestures: MultiFingerGesture.none,
      rotationWinGestures: MultiFingerGesture.none,
      rotationThreshold: 0.0,
      interactiveFlags:
          InteractiveFlag.pinchZoom | InteractiveFlag.drag,
      //Disable Rotation
      enableMultiFingerGestureRace: false, onTap: (_, __) => popupController
      .hideAllPopups()), // Hide popup when the map is tapped.
  nonRotatedChildren: [
    // AttributionWidget.defaultWidget(
    //   source: 'OpenStreetMap contributors',
    //   onSourceTapped: null,
    // ),
  ],
  children: [
    TileLayer(
      urlTemplate:
          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      subdomains: ['a', 'b', 'c'],
    ),
    TileLayer(
        urlTemplate:
            'https://tiles.openseamap.org/seamark/{z}/{x}/{y}.png',
        subdomains: ['a', 'b', 'c'],
        backgroundColor: Colors.transparent),
    PolylineLayer(polylines: [Polyline(
      points: positionsArray,
      color: Colors.white,
      strokeWidth: 4.0,
    ),],),
    PopupMarkerLayerWidget(
      options: PopupMarkerLayerOptions(
        popupController: popupController,
        markers: positionsArray.map((latLng) {
          final isLast = latLng == positionsArray.last;
          return Marker(
            width: 80.0,
            height: 80.0,
            point: latLng,
            builder: (ctx) => Container(
              child: Transform.rotate(
                angle: 0,
                child: isLast ? buildBoatMarker() : builOldPositionMarker(),
              ),
            ),
          );
        }).toList(),
        markerRotateAlignment:
        PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
        popupBuilder: (BuildContext context, Marker marker) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Time: ${marker.point.latitude.toString()}"),
                Text("Latitude: ${marker.point.latitude.toString()}"),
                Text("Longitude: ${marker.point.longitude.toString()}"),
              ],
            ),
          ),
        ),
      ),
    ),
    isAnchored
        ? CircleLayer(
            circles: [
              CircleMarker(
                point: positionsArray.last!,
                color: Colors.blue.withOpacity(0.3),
                borderStrokeWidth: 3.0,
                borderColor: Colors.blue,
                radius: DeviceConstants.radiusValue,
                useRadiusInMeter: true,
              ),
            ],
          )
        : CircleLayer(
            circles: [],
          ),
  ],
 )
