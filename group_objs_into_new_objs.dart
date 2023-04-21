final List<Map<String, dynamic>> input = [
    {
        "ts": 1681909200008,
        "value": "37.528153789931764",
        "key": "lat",
    },
    {
        "ts": 1681909210011,
        "value": "37.53421048228604",
        "key": "lat",
    },
    {
        "ts": 1681909220004,
        "value": "37.529561719635204",
        "key": "lat",
    },
    {
        "ts": 1681909230010,
        "value": "37.53060374122145",
        "key": "lat",
    },
    {
        "ts": 1681909240015,
        "value": "37.530822898650484",
        "key": "lat",
    },
    {
        "ts": 1681909200008,
        "value": "15.119295811325934",
        "key": "lon",
    },
    {
        "ts": 1681909210011,
        "value": "15.115406728022986",
        "key": "lon",
    },
    {
        "ts": 1681909220004,
        "value": "15.119646049299037",
        "key": "lon",
    },
    {
        "ts": 1681909230010,
        "value": "15.116754074482822",
        "key": "lon",
    },
    {
        "ts": 1681909240015,
        "value": "15.115507304616525",
        "key": "lon",
    }
];

final Map<DateTime, List<Map<String, dynamic>>> grouped = {};

// Group the items by ts property
for (final item in input) {
final DateTime ts = DateTime.fromMillisecondsSinceEpoch(item['ts'] as int);
if (!grouped.containsKey(ts)) {
grouped[ts] = [];
}
grouped[ts]!.add(item);
}

final List<Map<String, dynamic>> output = [];

// Iterate through the groups and create new objects
for (final group in grouped.values.toList()) {
final first = group.firstWhere((item) => item.containsKey('value') && item['key'] == 'lat');
final ts = first['ts'];
final lat = first['value'];
final second = group.firstWhere((item) => item.containsKey('value') && item['key'] == 'lon');
final lon = second['value'];

output.add({
'ts': ts,
'lat': lat,
'lon': lon,
});
}

print(output);
