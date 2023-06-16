String formattedDateTime =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime);

OR
          
String date = ('${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}T${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}Z');
