import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/New_Recipe.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  Widget customBottomNav() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedIconTheme: const IconThemeData(
        color: Colors.deepOrange
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.black
      ),
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "",
        )
      ],
    );
  }

  Widget HomeScreen() {
    return SafeArea(child: DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(children: [
        const SizedBox(height: 40,
        ),
        TabBar(
          isScrollable: true,
          tabs: [
            Tab(text: 'New Recipes'.toUpperCase(),),
            Tab(text: 'Favourites'.toUpperCase(),),
            Tab(text: 'Categories'.toUpperCase(),),
          ],
          labelColor: Colors.black,
          indicator: DotIndicator(
              color: Colors.black,
              distanceFromCenter: 16,
              radius: 3,
              paintingStyle: PaintingStyle.fill
          ),
          unselectedLabelColor: Colors.black.withOpacity(0.3),
          labelPadding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
        ),
        Expanded(
          child: TabBarView(children: [
            const NewRecipe(),
            Container(
              child: const Center(
                child: Text("Favourites"),
              ),
            ),
            Container(
              child: const Center(
                child: Text("Categories"),
              ),
            )
          ],),
        )
      ],
      ),
    ),
    );
  }

  Widget ProfileScreen() {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text('My Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrangeAccent, Colors.deepOrangeAccent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    // CircleAvatar(
                    //   backgroundColor: Colors.red.shade300,
                    //   minRadius: 35.0,
                    //   child: const Icon(
                    //     Icons.call,
                    //     size: 30.0,
                    //   ),
                    // ),
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                        NetworkImage('https://avatars.githubusercontent.com/u/88997018?v=4'),
                      ),
                    ),
                    // CircleAvatar(
                    //   backgroundColor: Colors.red.shade300,
                    //   minRadius: 35.0,
                    //   child: const Icon(
                    //     Icons.message,
                    //     size: 30.0,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Azzam Rabbani',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Master Chef Indonesia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.deepOrange.shade300,
                    child: const ListTile(
                      title: Text(
                        '2k',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        'Followers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: const ListTile(
                      title: Text(
                        '2k',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        'Following',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: const <Widget>[
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'example08@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Youtube',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'https://youtube.com/exapmle08',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Linkedin',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'www.linkedin.com/in/example08',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget body() {
    switch (selectedIndex) {
      case 0:
        return HomeScreen();
            break;
      case 1:
        return ProfileScreen();
        break;
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: body()
    );
  }
}
