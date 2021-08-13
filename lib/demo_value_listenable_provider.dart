import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter {
  final ValueNotifier<int> valueNotifier = ValueNotifier(0);
}

class DemoValueListenableProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Counter(),
      child: Consumer<Counter>(
        builder: (context, counter, child) {
          return ValueListenableProvider.value(
            value: counter.valueNotifier,
            child: Center(
              child: Column(
                children: [DemoConsumerWidget(), OtherWidget()],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DemoConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
      builder: (context, value, child) {
        return Text(
          value.toString(),
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}

class OtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        "Increment",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        final counter = context.read<Counter>();
        counter.valueNotifier.value++;
      },
    );
  }
}
