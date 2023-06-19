class TicketForm extends StatefulWidget {
  @override
  _TicketFormState createState() => _TicketFormState();
}

class _TicketFormState extends State<TicketForm> {
  final ticketFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: FormBuilder(
        key: ticketFormKey,
        child: Column(
          children: [
            FormBuilderTextField(
              key: Key("subject"),
              name: 'subject',
              keyboardType: TextInputType.text,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: 'Subject is required.'),
                ],
              ),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Subject'),
            ),
            SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
              key: Key("description"),
              name: 'description',
              keyboardType: TextInputType.multiline,
              maxLines: null,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: 'Description is required.'),
                ],
              ),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Description'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              key: Key("send"),
              child: Text('Send Ticket'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  primary: Colors.white),
              onPressed: () {
                if (ticketFormKey.currentState?.saveAndValidate() ?? false) {
                  var formValue = ticketFormKey.currentState!.value;
                  String subject = formValue["subject"];
                  String description = formValue["description"];
                  print(subject + " " + description);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
