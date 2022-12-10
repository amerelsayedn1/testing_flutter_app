import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final invitationSMS =
      "ADD+SPACE%20is%20a%20smart%20and%20safe%20way%20to%20store%20your%20things.%20Check%20out%20their%20service%20here:%20www.add.space";
  final invitation =
      "ADD+SPACE is a smart and safe way to store your things. Check out their service here: www.add.space";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                inviteUsingSMS();
              },
              child: Text('Send sms'),
            ),
          ],
        ),
      ),
    );
  }

  void inviteUsingSMS() async {
    Uri smsLaunchUri;

    if (Platform.isAndroid) {
      smsLaunchUri = Uri(
        scheme: 'sms',
        path: '',
        queryParameters: <String, String>{
          'body': invitation,
        },
      );
    } else {
      smsLaunchUri = Uri.parse("sms:''?body=$invitationSMS");
    }

    await launchUrl(smsLaunchUri);
  }

}
