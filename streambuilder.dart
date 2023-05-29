Stream<List<Message>> messageStream; // Assume you have a stream of messages

// Example: Create a stream controller
StreamController<List<Message>> _messageStreamController = StreamController<List<Message>>();

// Whenever a new message arrives, add it to the stream
_messageStreamController.add(newMessageList);

// Close the stream when you no longer need it
_messageStreamController.close();

StreamBuilder<List<Message>>(
  stream: messageStream, // The stream to listen to
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      // The stream has emitted some data
      List<Message> messages = snapshot.data;

      return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          Message message = messages[index];

          return ListTile(
            title: Text(message.sender),
            subtitle: Text(message.content),
          );
        },
      );
    } else if (snapshot.hasError) {
      // An error occurred while listening to the stream
      return Text('Error: ${snapshot.error}');
    } else {
      // The stream has not emitted any data yet
      return CircularProgressIndicator();
    }
  },
);
