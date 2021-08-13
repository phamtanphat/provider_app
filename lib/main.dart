import 'package:flutter/material.dart';

import 'basic.dart';
import 'demo_proxy_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: UserProvider()
        ),
      ),
    );
  }
}
