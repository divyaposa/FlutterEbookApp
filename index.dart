import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dark Mode Demo App',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(toggleTheme: toggleTheme, isDarkMode: _isDarkMode),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  HomeScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: () => toggleTheme(),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CardItem(title: 'Profile', icon: Icons.person),
          CardItem(title: 'Settings', icon: Icons.settings),
          CardItem(title: 'Notifications', icon: Icons.notifications),
          CardItem(title: 'Messages', icon: Icons.message),
          CardItem(title: 'Favorites', icon: Icons.favorite),
          CardItem(title: 'Help', icon: Icons.help),
          CardItem(title: 'About', icon: Icons.info),
        ],
      ),
    );
  }
}

// Drawer Menu
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SettingsScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AboutScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

// Card Item Widget
class CardItem extends StatelessWidget {
  final String title;
  final IconData icon;

  CardItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}

// Settings Screen
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('Theme'),
            subtitle: Text('Switch between Dark/Light mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// About Screen
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dark Mode Demo App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'This is a demo Flutter application showcasing dark mode '
              'toggle functionality, multiple screens, drawer navigation, '
              'and interactive UI elements.',
            ),
            SizedBox(height: 16),
            Text(
              'Version: 1.0.0',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Developed with ❤️ using Flutter.',
              style: TextStyle(fontStyle: FontStyle.italic),
              import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('darkMode') ?? false;
  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;
  MyApp({required this.isDarkMode});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  void toggleTheme() async {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', _isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dark Mode App',
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(toggleTheme: toggleTheme, isDarkMode: _isDarkMode),
    );
  }
}

// ---------------- Home Screen ----------------
class HomeScreen extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  HomeScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: () => toggleTheme(),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CardItem(title: 'Profile', icon: Icons.person, route: ProfileScreen()),
          CardItem(title: 'Messages', icon: Icons.message, route: MessagesScreen()),
          CardItem(title: 'Notifications', icon: Icons.notifications, route: NotificationsScreen()),
          CardItem(title: 'Settings', icon: Icons.settings, route: SettingsScreen()),
          CardItem(title: 'About', icon: Icons.info, route: AboutScreen()),
          CardItem(title: 'Favorites', icon: Icons.favorite, route: FavoritesScreen()),
          CardItem(title: 'Help', icon: Icons.help, route: HelpScreen()),
        ],
      ),
    );
  }
}

// ---------------- Drawer ----------------
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menu', style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
          DrawerTile(title: 'Home', icon: Icons.home, route: HomeScreen(toggleTheme: () {}, isDarkMode: false)),
          DrawerTile(title: 'Profile', icon: Icons.person, route: ProfileScreen()),
          DrawerTile(title: 'Messages', icon: Icons.message, route: MessagesScreen()),
          DrawerTile(title: 'Settings', icon: Icons.settings, route: SettingsScreen()),
          DrawerTile(title: 'About', icon: Icons.info, route: AboutScreen()),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget route;

  DrawerTile({required this.title, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (_) => route));
      },
    );
  }
}

// ---------------- Card Item ----------------
class CardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget route;

  CardItem({required this.title, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => route)),
      ),
    );
  }
}

// ---------------- Profile Screen ----------------
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://i.pravatar.cc/150')),
            SizedBox(height: 16),
            Text('John Doe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('johndoe@example.com'),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- Messages Screen ----------------
class MessagesScreen extends StatelessWidget {
  final List<Map<String, String>> messages = List.generate(10, (index) => {
        'sender': 'User ${index + 1}',
        'message': 'This is a sample message ${index + 1}'
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(messages[index]['sender']![0])),
            title: Text(messages[index]['sender']!),
            subtitle: Text(messages[index]['message']!),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          );
        },
      ),
    );
  }
}

// ---------------- Notifications Screen ----------------
class NotificationsScreen extends StatelessWidget {
  final List<String> notifications =
      List.generate(10, (index) => 'This is notification ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.notifications),
            title: Text(notifications[index]),
            onTap: () {},
          );
        },
      ),
    );
  }
}

// ---------------- Settings Screen ----------------
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('Theme'),
            subtitle: Text('Switch between dark/light mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// ---------------- About Screen ----------------
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dark Mode Flutter App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(
                'This app demonstrates a full Flutter application with multiple screens, drawer navigation, dark mode toggle, persistent settings, cards, lists, and interactive UI elements.'),
            SizedBox(height: 16),
            Text('Version: 1.0.0', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Developed with ❤️ using Flutter.', style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}

// ---------------- Favorites Screen ----------------
class FavoritesScreen extends StatelessWidget {
  final List<String> items = List.generate(15, (index) => 'Favorite Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: Text(items[index]),
            onTap: () {},
          );
        },
      ),
    );
  }
}

// ---------------- Help Screen ----------------
class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.help),
              title: Text('How to use this app'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_support),
              title: Text('Contact Support'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Send Feedback'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

            ),
          ],
        ),
      ),
    );
  }
}

