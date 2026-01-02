
import 'dart:convert';
import 'dart:ui';
import 'package:untitled7/aditionalinfo.dart';
import 'package:untitled7/wetherforcasst.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({super.key});

  @override
  State<WeatherAppScreen> createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {
  double temp = 0;
  Future <Map<String,dynamic>>getcurrentWether() async {
    try {
      String cityname = 'jalna';
      final res = await(http.get(
          Uri.parse(
              'https://api.openweathermap.org/data/2.5/forecast?q=$cityname&APPID=22e3e91a02fb8fd7dec5c7b0c4fe61c3'))
      );
      final dataa = jsonDecode(res.body);
      if (dataa['cod'] != '200') {
        throw 'error';
      }

      return dataa;
    }

    catch (e) {
      throw e.toString();
    }
  }
  @override

  void initState() {
    super.initState();
    getcurrentWether();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wether App', style: TextStyle(fontSize: 34)),
          centerTitle: true,
          actions: [IconButton  (onPressed: () {
            setState(() {

            });
          }, icon: Icon(Icons.refresh), iconSize: 32)
          ],
        ),
        body: FutureBuilder(
          future: getcurrentWether(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasError){
              return Center(child: Text('${snapshot.error}'));
            }
            final data=snapshot.data!;
            final currebtWetherdata=data['list'][0];
            final curenttemp=currebtWetherdata['main']['temp'];
            final curentsky=currebtWetherdata['weather'][0]['main'];
            final humadity=currebtWetherdata['main']['humidity'];
            final windspeed=currebtWetherdata['wind']['speed'];
            final currentpresure=currebtWetherdata['main']['pressure'];

              return
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              elevation: 10,

                              child: Padding(padding: EdgeInsets.all(16),
                                  child: ClipRRect(borderRadius: BorderRadius
                                      .circular(16),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Column(
                                          children: [
                                            Text('$curenttemp',
                                              style: TextStyle(fontSize: 32),),
                                            const SizedBox(height: 8),
                                            Icon(curentsky == 'Rain' ||
                                                curentsky == 'Clouds' ? Icons
                                                .cloud : Icons.sunny,
                                              size: 76,),
                                            const SizedBox(height: 8,),
                                            Text(curentsky,
                                              style: TextStyle(fontSize: 23),)
                                          ],
                                        ),
                                      )
                                  )
                              )
                          )
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Hourly Forcast', style: TextStyle(fontSize: 23),),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(


                          scrollDirection: Axis.horizontal,
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return Wethercastimfo(time:data['list'][index]['dt_txt']
                                .toString().substring(11,16), icon: curentsky == 'Rain' ||
                                curentsky == 'Clouds' ? Icons.cloud : Icons
                                .sunny, tem: data['list'][index]['main']['temp']
                                .toString());
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text('Additional information',
                        style: TextStyle(fontSize: 23),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AdditionalInformatonshow(
                            icon: Icons.water_drop_rounded,
                            condition: 'humidity',
                            value: '$humadity',),
                          AdditionalInformatonshow(icon: Icons.air,
                              condition: 'wind speed',
                              value: '$windspeed'),
                          AdditionalInformatonshow(icon: Icons.beach_access,
                              condition: 'presure',
                              value: '$currentpresure'),
                        ],
                      ),
                    ],
                  ),
                );
            }
        )
    );
  }


}

