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
