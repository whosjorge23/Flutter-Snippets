import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

Map<DateTime, List<CleanCalendarEvent>> _events = {
     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
       CleanCalendarEvent(
         'Event A',
         startTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day, 10, 0),
         endTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day, 12, 0),
         description:
             'rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mp4',
       ),
     ],
     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
         [
       CleanCalendarEvent(
         'Event B',
         startTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 10, 0),
         endTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 12, 0),
       ),
       CleanCalendarEvent(
         'Event C',
         startTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 14, 30),
         endTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 17, 0),
       ),
     ],
     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
         [
       CleanCalendarEvent(
         'Event B',
         startTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 10, 0),
         endTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 12, 0),
       ),
       CleanCalendarEvent(
         'Event C',
         startTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 14, 30),
         endTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 17, 0),
       ),
       CleanCalendarEvent(
         'Event D',
         startTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 14, 30),
         endTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 17, 0),
       ),
       CleanCalendarEvent(
         'Event E',
         startTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 14, 30),
         endTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 17, 0),
       ),
       CleanCalendarEvent(
         'Event F',
         startTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 14, 30),
         endTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 17, 0),
       ),
       CleanCalendarEvent(
         'Event G',
         startTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 14, 30),
         endTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 17, 0),
       ),
       CleanCalendarEvent(
         'Event H',
         startTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 14, 30),
         endTime: DateTime(DateTime.now().year, DateTime.now().month,
             DateTime.now().day + 2, 17, 0),
       ),
    ],
  };


Calendar(
                  startOnMonday: true,
                  weekDays: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'],
                  events: _events,
                  isExpandable: true,
                  eventDoneColor: Colors.green,
                  selectedColor: Colors.blue,
                  todayColor: Colors.blue,
                  eventColor: Colors.grey,
                  locale: 'en_EN',
                  todayButtonText: 'Today',
                  isExpanded: true,
                  expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                  dayOfWeekStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 11),
                  eventListBuilder:
                      (context, List<CleanCalendarEvent> events) => Expanded(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisCount: 2,
                      children: events
                          .map((event) => Column(
                                children: [
                                  // Icon(
                                  //   Icons.icecream,
                                  //   color: Colors.white,
                                  // ),
                                  TextButton(
                                      onPressed: () {
                                        print("event");
                                      },
                                      child: Text("Event: ${event.summary}")),
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                  dayBuilder: (context, daytime) {
                    var now = DateTime.now();
                    Color chipColor = Colors.grey;
                    Color dayTextColor = Colors.white;
                    var foundEvents = _events[
                        DateTime(daytime.year, daytime.month, daytime.day)];
                    if (foundEvents != null && foundEvents.isNotEmpty) {
                      chipColor = Colors.redAccent;
                      dayTextColor = Colors.white;
                    }
                    if (now.day == daytime.day && now.month == daytime.month) {
                      chipColor = Colors.blue;
                      dayTextColor = Colors.white;
                    }
                    return Chip(
                        label: days2Digits.contains(daytime.day.toString())
                            ? Text(
                                daytime.day.toString(),
                                style: TextStyle(color: dayTextColor),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  daytime.day.toString(),
                                  style: TextStyle(color: dayTextColor),
                                ),
                              ),
                        backgroundColor: chipColor);
                  },
                  bottomBarColor: Colors.white,
                )
  
  var days2Digits = [
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];
