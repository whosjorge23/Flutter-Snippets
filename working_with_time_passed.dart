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
        time = '$minutes${$strings.minutes_abbreviate}';
      } else if (difference.inDays < 7) {
        // Mostra i giorni trascorsi
        final days = difference.inDays;
        time = '$days${$strings.days_abbreviate}';
      } else {
        // Mostra la data completa
        time = DateFormat("yyyy-MM-dd").format(date!);
      }
    }
    return time;
  }
