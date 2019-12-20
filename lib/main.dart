import 'dart:async';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);




Future<Post> fetchPost() async {
  final response =
      await http.get('https://api.waqi.info/feed/beijing/?token=9132ade30e10d0c6bb2789b05bbb449f29fea2e6');
  
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }

  
}

class Post {
  
  String status;
  Data data;

  Post({this.status, this.data});

  Post.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
class Data {
  int aqi;
  int idx;
  List<Attributions> attributions;
  City city;
  String dominentpol;
  Iaqi iaqi;
  Time time;
  Debug debug;

  Data(
      {this.aqi,
      this.idx,
      this.attributions,
      this.city,
      this.dominentpol,
      this.iaqi,
      this.time,
      this.debug});

  Data.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'];
    idx = json['idx'];
    if (json['attributions'] != null) {
      attributions = new List<Attributions>();
      json['attributions'].forEach((v) {
        attributions.add(new Attributions.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    dominentpol = json['dominentpol'];
    iaqi = json['iaqi'] != null ? new Iaqi.fromJson(json['iaqi']) : null;
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    debug = json['debug'] != null ? new Debug.fromJson(json['debug']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aqi'] = this.aqi;
    data['idx'] = this.idx;
    if (this.attributions != null) {
      data['attributions'] = this.attributions.map((v) => v.toJson()).toList();
    }
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['dominentpol'] = this.dominentpol;
    if (this.iaqi != null) {
      data['iaqi'] = this.iaqi.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time.toJson();
    }
    if (this.debug != null) {
      data['debug'] = this.debug.toJson();
    }
    return data;
  }
}

class Attributions {
  String url;
  String name;

  Attributions({this.url, this.name});

  Attributions.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    return data;
  }
}

class City {
  List<double> geo;
  String name;
  String url;

  City({this.geo, this.name, this.url});

  City.fromJson(Map<String, dynamic> json) {
    geo = json['geo'].cast<double>();
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geo'] = this.geo;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Iaqi {
  Co co;
  Co h;
  Co no2;
  Co o3;
  Pm10 pm10;
  Pm10 pm25;
  Co so2;
  Co t;
  Co w;

  Iaqi(
      {this.co,
      this.h,
      this.no2,
      this.o3,
      this.pm10,
      this.pm25,
      this.so2,
      this.t,
      this.w});

  Iaqi.fromJson(Map<String, dynamic> json) {
    co = json['co'] != null ? new Co.fromJson(json['co']) : null;
    h = json['h'] != null ? new Co.fromJson(json['h']) : null;
    no2 = json['no2'] != null ? new Co.fromJson(json['no2']) : null;
    o3 = json['o3'] != null ? new Co.fromJson(json['o3']) : null;
    pm10 = json['pm10'] != null ? new Pm10.fromJson(json['pm10']) : null;
    pm25 = json['pm25'] != null ? new Pm10.fromJson(json['pm25']) : null;
    so2 = json['so2'] != null ? new Co.fromJson(json['so2']) : null;
    t = json['t'] != null ? new Co.fromJson(json['t']) : null;
    w = json['w'] != null ? new Co.fromJson(json['w']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.co != null) {
      data['co'] = this.co.toJson();
    }
    if (this.h != null) {
      data['h'] = this.h.toJson();
    }
    if (this.no2 != null) {
      data['no2'] = this.no2.toJson();
    }
    if (this.o3 != null) {
      data['o3'] = this.o3.toJson();
    }
    if (this.pm10 != null) {
      data['pm10'] = this.pm10.toJson();
    }
    if (this.pm25 != null) {
      data['pm25'] = this.pm25.toJson();
    }
    if (this.so2 != null) {
      data['so2'] = this.so2.toJson();
    }
    if (this.t != null) {
      data['t'] = this.t.toJson();
    }
    if (this.w != null) {
      data['w'] = this.w.toJson();
    }
    return data;
  }
}

class Co {
  double v;

  Co({this.v});

  Co.fromJson(Map<String, dynamic> json) {
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['v'] = this.v;
    return data;
  }
}

class Pm10 {
  int v;

  Pm10({this.v});

  Pm10.fromJson(Map<String, dynamic> json) {
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['v'] = this.v;
    return data;
  }
}

class Time {
  String s;
  String tz;
  int v;

  Time({this.s, this.tz, this.v});

  Time.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    tz = json['tz'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['tz'] = this.tz;
    data['v'] = this.v;
    return data;
  }
}

class Debug {
  String sync;

  Debug({this.sync});

  Debug.fromJson(Map<String, dynamic> json) {
    sync = json['sync'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sync'] = this.sync;
    return data;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  Future<void> _incrementCounter() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.data.aqi.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
           FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                _incrementCounter();
              },
              child: Text(
                "Log in",
              ),
            )
          ] 
          
          
        )),
      ),
    );
  }
}