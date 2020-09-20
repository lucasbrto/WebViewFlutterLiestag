import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/splash3.png'),
        nextScreen: MyHomePage(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.black,
        splashIconSize: 2500,
        duration: 3000,
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           title:  Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                Image.asset(
                  'assets/logo.png',
                  height: 35,
                ),
             ],
           )           
      ),
      body: WebView(
        initialUrl: "https://tecnologiaemfoco.glideapp.io/",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
