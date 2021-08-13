import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DemoStreamProvider extends StatelessWidget {

  Stream<int> getAge(){
    return Stream.fromFuture(Future.delayed(Duration(seconds: 10) , () => 400));
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      initialData: 0,
      create:(context) => getAge(),
      child: DemoFutureWidget(),
    );
  }
}


class DemoFutureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int value = Provider.of(context);
    return Center(
      child: Text(
        value.toString(),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}