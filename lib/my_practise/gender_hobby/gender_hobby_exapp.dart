import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/my_practise/gender_hobby/gender_hobby_provider.dart';

class GenderHobbyDemoUi extends StatefulWidget {
  const GenderHobbyDemoUi({super.key});

  @override
  State<GenderHobbyDemoUi> createState() => _GenderHobbyDemoUiState();
}

class _GenderHobbyDemoUiState extends State<GenderHobbyDemoUi> {
  //bool isCricket = false, isFootball = false, isSinging = false;
  // String gender = 'gender', male = 'male', feMale = 'feMale';
  //List hobbyList = [];
  // bool isSubmited = false;
  //bool isActive = false;

  @override
  Widget build(BuildContext context) {
    print('select is build');
    // GenderHobbyProvider genderHobbyProvider =
    //     context.read<GenderHobbyProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Selector<GenderHobbyProvider, TextEditingController>(
              builder: (context, value, child) => TextField(
                controller: value,
              ),
              selector: (contex, obj) => obj.txtFirstNameEditingController,
            ),
            Selector<GenderHobbyProvider, TextEditingController>(
              builder: (context, value, child) => TextField(
                controller: value,
              ),
              selector: (contex, obj) => obj.txtSurNameEditingController,
            ),
            Selector<GenderHobbyProvider, TextEditingController>(
              builder: (context, value, child) => TextField(
                controller: value,
              ),
              selector: (contex, obj) => obj.txtLastNameEditingController,
            ),
            Selector<GenderHobbyProvider, double>(
              builder: (context, value, child) => Slider(
                value: value,
                onChanged: (value) {
                  context.read<GenderHobbyProvider>().sliderMethod(value);
                },
                min: 1000,
                max: 50000,
              ),
              selector: (contex, obj) => obj.selectedSalary,
            ),
            Consumer<GenderHobbyProvider>(
              builder: (context, obj, child) => Row(
                children: [
                  const Text('gender :  '),
                  const Text('Male'),
                  Radio(
                    value: obj.male,
                    groupValue: obj.gender,
                    onChanged: (value) {
                      print('select is Male');

                      context.read<GenderHobbyProvider>().checkGender(value!);
                      //gender = value!;
                    },
                  ),
                  const Text('FeMale'),
                  Radio(
                    value: obj.feMale,
                    groupValue: obj.gender,
                    onChanged: (value) {
                      print('select is feMale');
                      context.read<GenderHobbyProvider>().checkGender(value!);
                      // gender = value!;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hobby :  '),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Selector<GenderHobbyProvider, bool>(
                            builder: (context, isCricket, child) {
                              print('select is Cricket');
                              return Checkbox(
                                value: isCricket,
                                onChanged: (value) {
                                  context
                                      .read<GenderHobbyProvider>()
                                      .cricketMethod(value!);
                                  //isFootball = value!;
                                },
                              );
                            },
                            selector: (context, obj) => obj.isCricket),
                        const Text('Cricket'),
                      ],
                    ),
                    Row(
                      children: [
                        Selector<GenderHobbyProvider, bool>(
                            builder: (context, isFootball, child) {
                              print('select is Football');
                              return Checkbox(
                                value: isFootball,
                                onChanged: (value) {
                                  context
                                      .read<GenderHobbyProvider>()
                                      .footballMethod(value!);
                                  //isFootball = value!;
                                },
                              );
                            },
                            selector: (context, obj) => obj.isFootball),
                        const Text('Football'),
                      ],
                    ),
                    Row(
                      children: [
                        Selector<GenderHobbyProvider, bool>(
                            builder: (context, isSinging, child) {
                              print('select is Singing');
                              return Checkbox(
                                value: isSinging,
                                onChanged: (value) {
                                  context
                                      .read<GenderHobbyProvider>()
                                      .singingMethod(value!);
                                  // isSinging = value!;
                                },
                              );
                            },
                            selector: (context, obj) => obj.isSinging),
                        const Text('Singing'),
                      ],
                    ),
                    Selector<GenderHobbyProvider, List>(
                      shouldRebuild: (previous, next) => true,
                      builder: (context, value, child) => DropdownButton(
                        items: value
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (value) {
                          context
                              .read<GenderHobbyProvider>()
                              .streamMethod(value as String);
                        },
                        value:
                            context.read<GenderHobbyProvider>().selectedStream,
                      ),
                      selector: (contex, obj) => obj.stream,
                    ),
                    Selector<GenderHobbyProvider, bool>(
                      builder: (context, isActive, child) => Switch(
                        value: isActive,
                        onChanged: (value) {
                          context
                              .read<GenderHobbyProvider>()
                              .switchMethod(value);
                        },
                      ),
                      selector: (contex, obj) => obj.isActive,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<GenderHobbyProvider>().showData();
              },
              child: const Text('submit'),
            ),
            const SizedBox(height: 10),
            Consumer<GenderHobbyProvider>(builder: (context, obj, child) {
              return obj.isSubmited == true
                  ? SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                              'Name :${obj.txtFirstNameEditingController.text}'),
                          Text(
                              'MiddleName :${obj.txtSurNameEditingController.text} '),
                          Text(
                              'LastName :${obj.txtLastNameEditingController.text} '),
                          Text('Gender :${obj.gender} '),
                          Text('Hobby :  ${obj.hobbyList}'),
                          Text('Stream : ${obj.selectedStream}'),
                          Text('Switch : ${obj.isActive}'),
                          Text('salary : ${obj.selectedSalary}')
                        ],
                      ),
                    )
                  : const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
