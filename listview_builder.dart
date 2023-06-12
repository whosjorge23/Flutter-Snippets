ListView.builder(
  itemCount: 8,
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        title: Text('Card ${index + 1}'),
        subtitle: Text('Subtitle ${index + 1}'),
      ),
    );
  },
)
