Future<String> getBase64String(String imagePath) async {
    final bytes = await Io.File(imagePath).readAsBytes();
    return base64Encode(bytes);
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePermanent = await saveImagePermanently(image.path);
      final base64String = await getBase64String(imagePermanent.path);

      setState(() {
        this.base64Image = base64String;
      });
      final base64Image = await getBase64String(imagePermanent.path);
      Base64ImageService.saveBase64Image(
          key: "profile_pic", image: base64Image);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<Io.File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = Io.File("${directory.path}/$name");
    return Io.File(imagePath).copy(image.path);
  }
////////////////////////////////////////////////////////////
ElevatedButton(
  child: const Text(
  'Select from Library'),
  onPressed: () => pickImage(
  ImageSource.gallery),
  ),
  ElevatedButton(
  child: const Text(
  '     Take a Picture     '),
  onPressed: () => pickImage(
  ImageSource.camera),
),

////////////////////////////////////
Io.File? image;
String base64Image = "";

@override
void initState() {
  // TODO: implement initState
  super.initState();
  Base64ImageService.getBase64Image(key: "profile_pic").then((value) {
    base64Image = value;
    setState(() {});
  });
}

///////////////////////////////////////////////////////

class Base64ImageService {
  static Future<void> saveBase64Image(
      {required String key, required String image}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, image);
  }

  static Future<String> getBase64Image({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }
}
