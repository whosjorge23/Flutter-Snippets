Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (channels.length == 1) ...[
            const Icon(
              Icons.comment,
              size: 200,
              color: Color(0xff6ae792),
            )
          ] else if (channels.length == 2) ...[
            const Icon(
              Icons.comment,
              size: 100,
              color: Colors.black,
            )
          ] else if (channels.length == 3) ...[
            const Icon(
              Icons.comment,
              size: 100,
              color: Colors.black,
            )
          ] else if (channels.length == 4) ...[
            const Icon(
              Icons.comment,
              size: 100,
              color: Colors.black,
            )
          ] else ...[
            Center(
                child: CircularProgressIndicator(
              color: yocDarkTheme.primaryColor,
            ))
          ],
        ],
      ),
