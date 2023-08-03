import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/my_practise/counter/provider_increment.dart';

class CounterIncrementDecrementUi extends StatefulWidget {
  const CounterIncrementDecrementUi({super.key});

  @override
  State<CounterIncrementDecrementUi> createState() =>
      _CounterIncrementDecrementUiState();
}

class _CounterIncrementDecrementUiState
    extends State<CounterIncrementDecrementUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    context.read<IncrementDecrementProvider>().decrement();
                  },
                  icon: const Icon(Icons.remove)),
              // Consumer<IncrementDecrementProvider>(
              //   builder: (context, obj, child) {
              //     print('i am counter1 re-build');
              //     return Text(
              //       context
              //           .watch<IncrementDecrementProvider>()
              //           .countIncrement
              //           .toString(),
              //     );
              //   },
              // ),
              Selector<IncrementDecrementProvider, int>(
                builder: (context, value, child) {
                  print('i am counter1 re-build');

                  return Text(value.toString());
                },
                selector: (context, obj) => obj.countIncrement,
              ),
              IconButton(
                  onPressed: () {
                    context.read<IncrementDecrementProvider>().increment();
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    context.read<IncrementDecrementProvider>().decrement2();
                  },
                  icon: const Icon(Icons.remove)),

              // Consumer<IncrementDecrementProvider>(
              //   builder: (context, obj, child) {
              //     print('i am counter2 re-build');
              //     return Text(
              //       context
              //           .watch<IncrementDecrementProvider>()
              //           .doubleCount
              //           .toString(),
              //     );
              //   },
              // ),
              Selector<IncrementDecrementProvider, int>(
                builder: (context, value, child) {
                  print('i am counter2 re-build');

                  return Text(value.toString());
                },
                selector: (context, obj) => obj.doubleCount,
              ),
              IconButton(
                  onPressed: () {
                    context.read<IncrementDecrementProvider>().increment2();
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}
