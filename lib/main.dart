import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index]; //key값을 넘겨주기 위해 문자열 필요
            return Dismissible(
              key: Key(item),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  items.removeAt(index);
                });

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red),
              child: ListTile(
                title: Text(item),
              ),
            );
          },
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'dart:ui';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<int> items = List<int>.generate(50, (i) => i);

//   @override
//   Widget build(BuildContext context) {
//     // final ColorScheme colorScheme = Theme.of(context).colorScheme;
//     // final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
//     // final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
//     final Color oddColor = Colors.lime.shade100;
//     final Color evenColor = Colors.deepPurple.shade100;

//     final List<Card> cards = [
//       for (int i = 0; i < items.length; i++)
//         Card(
//           key: Key('$i'),
//           // color: i.isOdd ? oddColor : evenColor,
//           color: items[i].isOdd ? oddColor : evenColor,
//           child: SizedBox(
//             height: 80,
//             child: Center(
//               child: Text('Card ${items[i]}'),
//             ),
//           ),
//         ),
//     ];

//     Widget proxyDecorator(Widget child, int i, Animation<double> animation) {
//       return AnimatedBuilder(
//           animation: animation,
//           child: child,
//           builder: (BuildContext context, Widget? child) {
//             final double animValue =
//                 Curves.easeInOut.transform(animation.value);
//             final double elevation = lerpDouble(1, 6, animValue)!;
//             final double scale = lerpDouble(1, 1.02, animValue)!;
//             return Transform.scale(
//               scale: scale,
//               child: Card(
//                 elevation: elevation,
//                 color: cards[i].color,
//                 child: cards[i].child,
//               ),
//             );
//           });
//     }

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('ReorderableListView')),
//         body: Center(
//           child: ReorderableListView(
//             proxyDecorator: proxyDecorator,
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             header: const Text('This is the header!'),
//             children: cards,
//             // children: [
//             //   for (int i = 0; i < items.length; i++)
//             //     ListTile(
//             //         key: Key('$i'),
//             //         title: Text('Item # ${items[i]}'),
//             //         tileColor: i.isOdd ? oddColor : evenColor),
//             // ],
//             onReorder: (oldIndex, newIndex) {
//               setState(() {
//                 if (oldIndex < newIndex) {
//                   newIndex -= 1;
//                 }
//                 var temp = items.removeAt(oldIndex); //나(요소)를 제거하고 반환
//                 items.insert(newIndex, temp);
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
