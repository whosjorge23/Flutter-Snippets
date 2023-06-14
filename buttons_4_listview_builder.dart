class ListViewButton extends StatelessWidget {
  const ListViewButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(color: yocDarkTheme.primaryColor),
          ),
        ),
      ),
    );
  }
}
