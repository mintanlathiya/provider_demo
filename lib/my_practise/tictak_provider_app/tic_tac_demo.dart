import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/my_practise/tictak_provider_app/tic_tac_provider.dart';

class TicTacDemo extends StatefulWidget {
  const TicTacDemo({super.key});

  @override
  State<TicTacDemo> createState() => _TicTacDemoState();
}

class _TicTacDemoState extends State<TicTacDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Selector<TicTacProvider, int>(
                      builder: (context, value, child) => Text(
                        value.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      selector: (context, obj) => obj.player1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Player 1(X)'),
                  ],
                ),
                Column(
                  children: [
                    Selector<TicTacProvider, int>(
                      builder: (context, value, child) => Text(
                        value.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      selector: (context, obj) => obj.player2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Player 2(O)'),
                  ],
                ),
              ],
            ),
          ),
          Consumer<TicTacProvider>(
            builder: (context, obj, child) => Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => context.read<TicTacProvider>().play(index),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            spreadRadius: 3,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        context.read<TicTacProvider>().gamePlay[index],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: obj.gamePlay.length,
              ),
            ),
          ),
          Consumer<TicTacProvider>(
            builder: (context, value, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    value.clear();
                  },
                  child: const Text('Reset'),
                ),
                MaterialButton(
                  onPressed: () {
                    value.restart();
                  },
                  child: const Text('Restart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
