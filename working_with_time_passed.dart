String getNewsTime() {
  final now = DateTime.now();
  String time = "";

  if (date != null) {
    final difference = now.difference(date!);
    if (difference.inDays < 1) {
      // Mostra i minuti trascorsi tra now e date.day
      final minutes = difference.inMinutes;
      time = '$minutes minuti fa';
    } else if (difference.inDays < 7) {
      // Mostra i giorni trascorsi
      final days = difference.inDays;
      time = '$days giorni fa';
    } else {
      // Mostra la data completa
      time = date!.toString();
    }
  }

  return time;
}

//If you don't have parameters you can use the getter

String get newsTime {
    final now = DateTime.now();
    String time = "";
    if (date != null) {
      final difference = now.difference(date!);
      if (difference.inDays < 1) {
        // Mostra i minuti trascorsi tra now e date.day
        final minutes = difference.inMinutes;
        if (minutes > 60) {
          // Verifico se sono passati più di 60 minuti
          final hours = (minutes / 60).floor();
          final remainingMinutes = minutes % 60;
          if (remainingMinutes == 0) {
            // Elimino il resto dei minuti se l'ora non contiene minuti
            time = '${hours}h ago';
          } else {
            // Aggiungo il resto dei minuti se l'ora contiene minuti
            time = '${hours}h${remainingMinutes.toString().padLeft(2, '0')}m ago';
          }
        } else {
          time = '${minutes}m ago';
        }
      } else if (difference.inDays < 7) {
        // Mostra i giorni trascorsi
        final days = difference.inDays;
        time = '${days}d ago';
      } else {
        // Mostra la data completa
        time = DateFormat("yyyy-MM-dd").format(date!);
      }
    }
    return time;
  }

//Best version
String get newsTime {
  final now = DateTime.now();
  String time = "";

  if (date != null) {
    // Calculate the time difference between now and the provided date
    final difference = now.difference(date!);

    if (difference.inDays < 1) {
      // If the difference is less than 1 day, show the minutes and hours (if applicable)
      final minutes = difference.inMinutes;

      if (minutes > 60) {
        // Show hours and remaining minutes if the difference is more than 1 hour
        final hours = (minutes / 60).floor();
        final remainingMinutes = minutes % 60;

        if (remainingMinutes == 0) {
          // If there are no remaining minutes, display only the hours
          time = '${hours}${$strings.hours_abbreviate}';
        } else {
          // Display both hours and minutes in the format: "3h 04m"
          time = '${hours}h${remainingMinutes.toString().padLeft(2, '0')}${$strings.minutes_abbreviate}';
        }
      } else {
        // Display minutes if the difference is less than 1 hour
        time = '$minutes${$strings.minutes_abbreviate}';
      }
    } else if (difference.inDays < 7) {
      // If the difference is less than 7 days, show the number of days
      final days = difference.inDays;
      time = '$days${$strings.days_abbreviate}';
    } else {
      // If the difference is more than 7 days, show the complete date
      time = DateFormat("yyyy-MM-dd").format(date!);
    }
  }

  return time;
}

