import 'package:flutter/material.dart';
import 'package:mad2_app/holiday_page.dart';
import 'about_page.dart';
import 'home_page.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key, required this.setSignedIn, required this.title}) : super(key: key);
  final String title;
  final void Function(bool signedIn) setSignedIn;

  @override
  State<Nav> createState() => _NavState();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyApp(title: 'liverpool'),
    );
  }
}
class _NavState extends State<Nav> {
  int currentPage = 0;
  List<Widget> pages = [
    const HomePage(),
    HolidayPage(setSignedIn: (bool signedIn) {  },),
    const LicensePageCustom()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        actions: <Widget>[
          Padding(padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: (){widget.setSignedIn(false);},
              child:const Icon(
                Icons.logout,
                size:26.0,
              ),
          )
          )
        ],
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.holiday_village), label: 'Holidays'),
          NavigationDestination(icon: Icon(Icons.contact_support), label: 'About')
        ],
        onDestinationSelected: (int index){
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
// State<HomePage> createState() => _MainPageState();
// class _MainPageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(onPressed: () {
//
//     }, icon: const Icon(Icons.logout),);
//   }
// }
