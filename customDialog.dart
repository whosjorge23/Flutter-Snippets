buildDialog({
    required bool isDismissable,
    required String text,
    required VoidCallback onClick,
		required int containerHeight,
  }) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // Set barrierDismissible to false
      builder: (BuildContext context) => AlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            ConfigConstants.SPLASH_SCREEN_LOGO_POS,
            width: 50,
          ),
        ),
        content: Container(
          height: containerHeight,
          child: Text(text),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              onClick();
            },
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );
  }
