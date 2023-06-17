class ContainerHourlyWeather extends StatelessWidget {
  ContainerHourlyWeather(
      {Key? key,
        required this.title,
        required this.timeStamps,
        required this.weatherConditions,
        required this.icon,
        this.isDoubleBox = false})
      : super(key: key);

  String title;
  List<String> timeStamps;
  bool? isDoubleBox;
  IconData icon;
  WeatherConditionsDTO weatherConditions;
  
  String formatTimeString(String timeStamp) {
    DateTime dateTime = DateTime.parse(timeStamp);
    String formattedTime = dateTime.hour.toString().padLeft(2, '0');
    return formattedTime;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.3),
      ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                  ],
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: timeStamps.length,
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                            Text(
                              " ${hour} ",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
                            ),
                            Image.network("imageURL", scale: 2),
                            Text(
                                  " ${temperature}°",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
    );
  }
}
