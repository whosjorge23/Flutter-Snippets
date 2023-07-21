Widget build(BuildContext context) {
  return Localization(
    delegates: [
      DefaultMaterialLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
      // Add the CupertinoLocalizations delegate
      DefaultCupertinoLocalizations.delegate,
    ],
    child: YourWidget(),
  );
}
