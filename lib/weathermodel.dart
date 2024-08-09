
class Weather {
  String? cityname;
  String? temprature;
  String? descrpition;


  

  Weather({
    required this.cityname,
    required this.temprature,
                      required this.descrpition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(





      cityname: json['name'],
       temprature: json['main']['temp'].toString(),
                  descrpition: json['weather'][0]['description'],
    );
  }
}
