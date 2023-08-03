import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider_ex.dart/counter_provider.dart';

class CounterDemoUi extends StatefulWidget {
  const CounterDemoUi({super.key});

  @override
  State<CounterDemoUi> createState() => _CounterDemoUiState();
}

class _CounterDemoUiState extends State<CounterDemoUi> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('i am build method');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            // child: Text(
            //   //Provider.of<CounterProvider>(context).count.toString(),
            // context.watch<CounterProvider>().count.toString(),

            //   style: const TextStyle(fontSize: 40),
            // ),
            child: Consumer<CounterProvider>(
              builder: (context, obj, child) {
                print('i am re-build');
                return Text(
                  obj.count.toString(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Provider.of<CounterProvider>(context, listen: false).increment();
          context.read<CounterProvider>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
