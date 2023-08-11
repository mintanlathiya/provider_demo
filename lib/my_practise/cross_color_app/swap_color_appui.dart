import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/my_practise/cross_color_app/swapcolorprovider_demo.dart';

class ColorChangeDemoUi extends StatefulWidget {
  const ColorChangeDemoUi({super.key});

  @override
  State<ColorChangeDemoUi> createState() => _ColorChangeDemoUiState();
}

class _ColorChangeDemoUiState extends State<ColorChangeDemoUi> {
  @override
  Widget build(BuildContext context) {
    print(' re build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Change'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Consumer<ColorSwapProvider>(
              builder: (context, obj, child) => Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  children: List.generate(
                    obj.colorList.length,
                    (index) => GestureDetector(
                      onTap: () {
                        context.read<ColorSwapProvider>().selectColors(index);
                      },
                      child: Container(
                        color: obj.colorList[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
