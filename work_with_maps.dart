latLngValue != null
            ? FlutterMap(
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
                    enableMultiFingerGestureRace: false),
                nonRotatedChildren: [
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
                  MarkerLayer(
                    markers: positionsArray.map((latLng) {
                      final isLast = latLng == positionsArray.last;
                      return Marker(
                        width: 80.0,
                        height: 80.0,
                        point: latLng,
                        builder: (ctx) => Container(
                          child: Transform.rotate(
                            angle: 0,
                            child: isLast
                                ? buildMarker()
                                : builOldPositionMarker(),
                          ),
                        ),
                      );
                    }).toList(),
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
            : SizedBox.shrink()
