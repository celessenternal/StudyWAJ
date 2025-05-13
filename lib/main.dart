import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'UI/home.dart';
import 'UI/screen1.dart';
import 'UI/screen2.dart';
import 'UI/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 10) {
        resetCounter();
      }
    });
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildScreen() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen(onIncrement: _incrementCounter, counter: _counter);
      case 1:
        return const Screen1();
      case 2:
        return const Screen2();
      case 3:
        return const UserScreen();
      default:
        return const Center(child: Text("Unknown Page"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Screen1"),
          BottomNavigationBarItem(icon: Icon(Icons.view_module), label: "Screen2"),
          BottomNavigationBarItem(icon: Icon(Icons.switch_account_sharp), label: "User"),
        ],
      ),
    );
  }
}
