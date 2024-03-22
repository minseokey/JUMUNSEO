import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:jumunseo/user.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [UserSchema],
    directory: dir.path,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final user = User()..name = 'John Doe';

  var newUser = User()
    ..name = 'Jane Doe'
    ..age = 36;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ExtendedImage.asset('assets/images/NJ_GetUp_2.jpeg')
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: isarTest,
            tooltip: 'Increment',
            child: const Text('isar'),
          ),
          FloatingActionButton(
            onPressed: testHttp,
            tooltip: 'Increment',
            child: const Text('http'),
          ),
          FloatingActionButton(
            onPressed: testImgPick,
            tooltip: 'Increment',
            child: const Text('imgpick'),
          ),
          FloatingActionButton(
            onPressed: testImgCompress,
            tooltip: 'Increment',
            child: const Text('imgcompress'),
          ),
          FloatingActionButton(
            onPressed: testInfinteScroll,
            tooltip: 'Increment',
            child: const Text('infscr'),
          ),
          FloatingActionButton(
            onPressed: testPermission,
            tooltip: 'Increment',
            child: const Text('permission'),
          ),
          FloatingActionButton(
            onPressed: testWebview,
            tooltip: 'Increment',
            child: const Text('webview'),
          ),
        ],
      ),
    );
  }

  void isarTest() async {
    final isar = Isar.getInstance();

    await isar?.writeTxn(() async {
      await isar.users.put(newUser); // insert & update
    });

    var existingUser = await isar?.users.get(newUser.id); // get

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('User name: ${existingUser?.name}'),
            actions: [
              TextButton(
                onPressed: () async {
                  final num = existingUser!.id;
                  await isar?.writeTxn(() async {
                    await isar.users.delete(existingUser!.id); // delete
                  });

                  newUser = User()
                    ..id = num
                    ..name = 'Jsasd'
                    ..age = 36;

                  await isar?.writeTxn(() async {
                    await isar.users.put(newUser); // insert & update
                  });

                  setState(() {});
                },
                child: const Text('change'),
              ),
            ],
          );
        });
  }

  void testHttp() {}
  Future<void> testImgPick() async {
    final ImagePicker picker = ImagePicker();
    final XFile? response = await picker.pickImage(source: ImageSource.gallery);
  }

  void testImgCompress() {}
  void testInfinteScroll() {}
  void testPermission() {}
  void testWebview() {}
}
