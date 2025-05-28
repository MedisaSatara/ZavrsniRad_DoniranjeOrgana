import 'package:flutter/material.dart';

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/Organ4Life.jpg',
                  height: 90,
                ),
                SizedBox(height: 15),
                Text(
                  "Organ4Life",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const NavTile(label: "Home page", icon: Icons.dashboard),
          const NavTile(label: "Donor", icon: Icons.favorite),
          const NavTile(label: "Organ recipient", icon: Icons.group),
          const NavTile(label: "Users", icon: Icons.group),
          const Spacer(),
          const NavTile(label: "Settings", icon: Icons.settings),
          const NavTile(label: "Admin profile", icon: Icons.person),
          const NavTile(label: "Logout", icon: Icons.logout),
        ],
      ),
    );
  }
}

class NavTile extends StatelessWidget {
  final String label;
  final IconData icon;

  const NavTile({
    required this.label,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(label),
      onTap: () {
      },
    );
  }
}
