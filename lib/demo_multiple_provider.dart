import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/demo_change_notifier.dart';

class Counter1 with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  increment() {
    _count++;
    print(_count);
    notifyListeners();
  }
}

class Counter2 with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  increment() {
    _count++;
    print(_count);
    notifyListeners();
  }
}

class DemoMultipleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter1()),
        ChangeNotifierProvider(create: (context) => Counter2()),
      ],
      child: TestWidget1(),
    );
  }
}

class TestWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter1 counter1 = Provider.of(context);
    Counter2 counter2 = Provider.of(context);

    return Center(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'count1 = ${counter1.count.toString()} count2 = ${counter2.count.toString()}',
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                onPressed: () {
                  counter1.increment();
                  counter2.increment();
                },
                child: Text(
                  "Increment",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
      ),
    );
  }
}




// Demo 2

class Counter3 {
  int _count = 0;

  int get count => _count;

  increment() {
    _count++;
  }
}

class Counter4 {
  int _count = 0;

  int get count => _count;

  increment() {
    _count++;
  }
}
class DemoMultipleProvider2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Counter3>.value(value: Counter3() , key: Key("Counter3")),
        Provider<Counter4>.value(value: Counter4(), key: Key("Counter3")),
      ],
      child: TestWidget2(),
    );
  }
}

class TestWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter3 counter3 = context.watch<Counter3>();
    Counter4 counter4 = context.watch<Counter4>();

    return Center(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'count1 = ${counter3.count.toString()} count2 = ${counter4.count.toString()}',
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                onPressed: () {
                  counter3.increment();
                  counter4.increment();
                },
                child: Text(
                  "Increment",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
      ),
    );
  }
}