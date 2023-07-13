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
