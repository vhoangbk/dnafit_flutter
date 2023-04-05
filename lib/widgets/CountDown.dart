import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => CountDownState();
}

class CountDownState extends State<CountDown> {
  int count = 100;

  _onPress() {
    print("count $count");
    setState(() {
      count--;
    });
    print("count $count");
  }

  @override
  void initState() {
    // TODO: implement initState
    print("initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CountDown oldWidget) {
    // TODO: implement didUpdateWidget
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print("deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("didUpdateWidget");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build...");
    return (Column(
      children: [TextButton(onPressed: _onPress, child: Text("$count"))],
    ));
  }
}
