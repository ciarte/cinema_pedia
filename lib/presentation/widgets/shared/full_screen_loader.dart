import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadedMessages() {
    final messages = <String>[
      'cARGANDO pELICulAs',
      'CompRaNDo lAs PaloMItAs',
      'Esto Tarda Mas DE lO esPerADO',
      'Ya FAltA pOcO...'
    ];

    return Stream.periodic(const Duration(seconds: 1), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'espere',
        ),
        const SizedBox(height: 30),
        const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        const SizedBox(height: 30),
        StreamBuilder(
            stream: getLoadedMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('CarGAnDo...');
              return Text(snapshot.data!);
            })
      ]),
    );
  }
}
