class ApisService {
  static const full_api_path = "https://your.endpoint.com/";
  static const service_uri = "api/";
  static const headers = {
    "Accept": "application/json",
    "content-type": "application/x-www-form-urlencoded"
  };
  
  static Future<AuthEntity?> auth(AuthRequest auth) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        ConfigConstants.errorAuthEntity.error = "";

        final socket = await SecureSocket.connect('your.endpoint.com', 443);
        final certificate = socket.peerCertificate;
        List<int>? certificateBytes = certificate?.pem.codeUnits;
        final securityContext = SecurityContext();
        securityContext.setTrustedCertificatesBytes(certificateBytes!);

        final url = Uri.parse(full_api_path + service_uri + "apiurl/");
        HttpClient client = HttpClient(context: securityContext);
        // HttpClient client = HttpClient()
        //  ..badCertificateCallback =
        //      ((X509Certificate cert, String host, int port) => true);
        var ioClient = IOClient(client);
        http.Response response = await ioClient.post(url,
            body: {
              "username": auth.username,
              "userPassword": auth.userPassword
            },
            headers: headers);
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          return AuthEntity.fromJson(jsonResponse);
        } else {
          var jsonResponse = jsonDecode(response.body);
          return AuthEntity.fromJson(jsonResponse);
        }
      } on Exception catch (exception) {
        ConfigConstants.errorAuthEntity.error =
            "Error to establish connection with the server ${exception.toString()}";
      }
    } else {
      ConfigConstants.errorAuthEntity.error = "No Internet";
    }
  }
 }

Future<String> readAsset(String filePath) async {
    return await rootBundle.loadString(filePath);
  }

  ConfigConstants.keyPinning = await readAsset('lib/assets/key.txt');
  ConfigConstants.keyPinningProv = await readAsset('lib/assets/prov_key.txt');
  // print('File contents: ${ConfigConstants.keyPinning}');
  // print('File contents: ${ConfigConstants.keyPinningProv}');
  // print(
  //     "Contained: ${ConfigConstants.keyPinning.contains(ConfigConstants.keyPinning)}");
