import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApi{
  int _count = 1;

  int get count => _count;
}

class CounterService{
  CounterApi _counterApi;

  CounterService({@required CounterApi api}) : _counterApi = api;

  CounterApi get counterApi => _counterApi;
}

class CounterModel {
  CounterService _counterService;

  CounterModel({@required CounterService counterService}) : _counterService = counterService;

  CounterService get counterService => _counterService;
}

class DemoProxyProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
              create:(_) => CounterApi(),
          ),
          ProxyProvider<CounterApi,CounterService>(
           update: (context , counterApi , previos) => CounterService(api: counterApi)
          ),
          ProxyProvider<CounterService,CounterModel>(
              update: (context , counterService , previos) => CounterModel(counterService: counterService)
          ),
        ],
      child: TestWidget(),
    );
  }
}


class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(context.watch<CounterModel>().counterService.counterApi.count.toString());
  }
}

