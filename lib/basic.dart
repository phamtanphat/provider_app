import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  String _name;

  String get name => _name;

  set name(name) => _name = name;
}

class UserProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = User();
    user.name = "Pham Tan Phat";
    return Provider<User>.value(
      value: user,
      child: BasicWidget(),
    );
  }
}

class BasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [DemoConsumerWidget(), DemoWithoutConsumerWidget()],
      ),
    );
  }
}

class DemoConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) {
        print(child);
        return Text(user.name);
      },
    );
  }
}

class DemoWithoutConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of(context);
    return Text(user.name);
  }
}
