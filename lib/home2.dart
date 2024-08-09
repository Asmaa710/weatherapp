import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weatherprovider.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 12, 12),
      body: Padding(
        padding: EdgeInsets.all(60),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  hintText: "Search City",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
                onSubmitted: (city) {
                  if (city.isNotEmpty) {
                    context.read<WeatherProvider>().fetchweather(city);
                  }
                },
              ),
              SizedBox(height: 20),
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
              
                       Widget displayImage = Image.asset(
                    "assets/Capture2.GIF",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  );

                  if (weatherProvider.weather != null) {
                    double temp = double.parse(weatherProvider.weather!.temprature!);
                    if (temp > 25) {
                      displayImage = Image.asset(
                        "assets/Capture3 (2).GIF",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      );
                    } else if (temp < 15) {
                      displayImage = Image.asset(
                        "assets/Capture4.GIF",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      );
                    }
                  }

                  return Column(
                    children: [
                      if (weatherProvider.isLoading)
                        CircularProgressIndicator()
                      else if (weatherProvider.weather != null) ...[
                        Text(
                          weatherProvider.weather!.cityname!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Temperature: ${weatherProvider.weather!.temprature}°C',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Condition: ${weatherProvider.weather!.descrpition}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    
                      displayImage,
                      SizedBox(height: 40),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/Capture3 (2).GIF",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/Capture4.GIF",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/Capture5.GIF",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/Capture 66.GIF",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/Capture6.GIF",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/Capture 7.GIF",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


