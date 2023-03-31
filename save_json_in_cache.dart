List<Object> myObjectsList = [];

fetchObjects() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("myObjects") != null) {
      var myObjects = prefs.getString("myObjects");
      for (var item in jsonDecode(myObjects!)) {
        myObjectsList.add(Ojbect.fromJson(item));
      }
    } else {
      myObjectsList = await ObjectApisService.getObjects();
    }

    print("OBJECTS: ${prefs.getString("myObjects")}");
    print("OBJECTS: ${myObjectsList}");
     setState(() {});
  }



class ObjectApisService {
  static const headers = {
    "Accept": "application/json",
    "content-type": "application/json"
  };

  static Future<List<Ojbect>> getVessels() async {
    final url = Uri.parse("your-endpoint.com");
    http.Response response =
        await AuthenticatedHttpClient().get(url, headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print("JSON: ${response.body.toString()}");
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('myObjects', response.body.toString());
      printResponse(response);
      List<Ojbect> objects = [];
      for (var item in jsonResponse) {
        objects.add(Ojbect.fromJson(item));
      }
      return objects;
    } else {
      printResponse(response);
      return [];
    }
  }

  static void printResponse(http.Response response) {
    print("Code response status: " + response.statusCode.toString());
    print("Code response body: " + response.body.toString());
    print("Code response request: " + response.request.toString());
    print("Response: " + response.toString());
  }
}
