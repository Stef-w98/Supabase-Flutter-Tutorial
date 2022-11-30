import 'package:flutter/material.dart';
import 'package:supabase_auth/screens/Profile.dart';
import 'package:supabase_auth/supabase_state/auth_require_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends AuthRequiredState<DashboardScreen> {
  User? user;
  int currentPage = 0;

  @override
  void onAuthenticated(Session session) {
    final _user = session.user;
    user = _user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 30.0,
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ProfilePage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Medication'),
              leading: Icon(Icons.medication_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ProfilePage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Weight'),
              leading: Icon(Icons.monitor_weight_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ProfilePage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Temperature'),
              leading: Icon(Icons.thermostat_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ProfilePage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Bloodpresure'),
              leading: Icon(Icons.medical_information_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ProfilePage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Saturation'),
              leading: Icon(Icons.water_drop_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ProfilePage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Heart rate'),
              leading: Icon(Icons.monitor_heart_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ProfilePage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ProfilePage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('MedRemind'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 34,
            width: 264,
            margin: const EdgeInsets.only(
              left: 15,
              right: 16,
            ),
            child: const Text(
              "MedRemind",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          SizedBox(
            height: 70.0,
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "User: ${user!.userMetadata['full_name'] ?? user!.email}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onTapSignOut();
            },
            child: const Text('SignOut'),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.inventory), label: 'Inventory'),
          NavigationDestination(
              icon: Icon(Icons.medication), label: 'Medication'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }

  void onTapSignOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
