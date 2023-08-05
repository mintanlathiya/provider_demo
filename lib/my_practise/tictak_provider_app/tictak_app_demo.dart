import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/my_practise/tictak_provider_app/tictak_provider.dart';

class TicTacAppDemoUi extends StatefulWidget {
  const TicTacAppDemoUi({super.key});

  @override
  State<TicTacAppDemoUi> createState() => _TicTacAppDemoUiState();
}

class _TicTacAppDemoUiState extends State<TicTacAppDemoUi> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Consumer<TikTacmethodProvider>(
              builder: (context, obj, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'PLAYER 1',
                        style: TextStyle(fontSize: 45, color: Colors.white),
                      ),
                      Text(
                        obj.oScore.toString(),
                        style:
                            const TextStyle(fontSize: 45, color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'PLAYER 2',
                        style: TextStyle(fontSize: 45, color: Colors.white),
                      ),
                      Text(
                        obj.xScore.toString(),
                        style:
                            const TextStyle(fontSize: 45, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Consumer<TikTacmethodProvider>(
              builder: (context, obj, child) => Expanded(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      context
                          .read<TikTacmethodProvider>()
                          .tapped(index, context);
                    },
                    child: Card(
                      color: obj.cardColor[index],
                      elevation: 2,
                      shape: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      child: Center(
                        child: Text(
                          obj.displayElement[index],
                          style: const TextStyle(
                              fontSize: 80,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<TikTacmethodProvider>(
                  builder: (context, obj, child) => MaterialButton(
                    onPressed: () {
                      obj.clearScoreBoard();
                    },
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 70,
                    color: Colors.white,
                    child: const Text(
                      'Clear Score Board',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Consumer<TikTacmethodProvider>(
                  builder: (context, obj, child) => MaterialButton(
                    onPressed: () {
                      obj.allClear();
                    },
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 70,
                    color: Colors.white,
                    child: const Text(
                      'Restart',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
