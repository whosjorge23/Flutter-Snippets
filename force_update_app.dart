UpgradeAlert(
  upgrader: Upgrader(
    debugLogging: true,
    showIgnore: false,
    showLater: false,
    messages: CustomMessages(),
    onUpdate: () {
      /*if (Platform.isAndroid) {
        LaunchURLService.launchInBrowser(
          Uri(
            scheme: 'https',
            host: 'play.google.com',
            path: '/store/apps/details?id=com.example.appName',
          ),
        );
      } else if (Platform.isIOS) {
        LaunchURLService.launchInBrowser(
          Uri(
            scheme: 'https',
            host: 'apps.apple.com',
            path: '/app/appName/id',
          ),
        );
      }*/
      //It is prefered the code below
      if (Platform.isAndroid) {
        StoreRedirect.redirect(
          androidAppId: 'com.example.appName',
        );
      } else if (Platform.isIOS) {
        StoreRedirect.redirect(
          iOSAppId: '1234567890',
        );
      }
      return true;
    },
    durationUntilAlertAgain: const Duration(minutes: 1),
    dialogStyle: Platform.isIOS
        ? UpgradeDialogStyle.cupertino
        : UpgradeDialogStyle.material,
  ),
  child: Center(),
),
