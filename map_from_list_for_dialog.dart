List<String> listAlarms = ["Alarm1", "Alarm2", "Alarm3"];

List<Widget> alarmWidgets = listAlarms.map((alarm) {
  return Text(alarm);
}).toList();

ListBody(
  children: <Widget>[
    Text('There are some devices triggered'),
    Text('Do you want to arm the ${globalTelemetryProvider.globalTelemetryState.boatStatus.boatName}\'s alarm anyway?'),
    ...alarmWidgets, // Aggiunge dinamicamente i widget della lista degli allarmi
  ],
),
