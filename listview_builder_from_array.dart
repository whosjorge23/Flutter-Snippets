ListView.builder(
  itemCount: items.length,
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      title: Text(items[index]),
      onTap: () {
        // Perform action when item is tapped
      },
    );
  },
);
