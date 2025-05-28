import 'package:doniranjeorgana_desktop/screens/welcome_screen.dart';
import 'package:doniranjeorgana_desktop/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:doniranjeorgana_desktop/screens/home_screen.dart';
import 'package:doniranjeorgana_desktop/screens/donor_register_screen.dart';
import 'package:doniranjeorgana_desktop/screens/patient_register_screen.dart';
import 'package:doniranjeorgana_desktop/screens/korisnici_screen.dart';

class MasterScreenWidget extends StatefulWidget {
  final Widget? child;
  final String? title;
  final int selectedIndex;

  const MasterScreenWidget({
    Key? key,
    this.child,
    this.title,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  State<MasterScreenWidget> createState() => _MasterScreenWidgetState();
}

class _MasterScreenWidgetState extends State<MasterScreenWidget> {
  final TextEditingController _searchController = TextEditingController();

  int _selectedIndex = 0;

  final Color sidebarBgColor = Color(0xFFFFF1F0);
  final Color selectedIconColor = Color(0xFFB71C1C); 
  final Color unselectedIconColor = Color(0xFF757575);
  final Color selectedTextColor = Color(0xFFB71C1C);

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  Widget _getScreenByIndex(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return DonorRegisterScreen();
      case 2:
        return PatientRegisterScreen();
      case 3:
        return UsersScreens();
      default:
        return HomeScreen();
    }
  }

  void _logout() {
    Authorization.korisnik = null;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
      (route) => false,
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 220,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset('assets/images/Organ4Life.jpg', height: 90),
          const SizedBox(height: 10),
          const Text(
            "Organ4Life",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB00020),
            ),
          ),
          const Divider(height: 30, thickness: 1, color: Color(0xFFBDBDBD)),
          _buildSidebarTile("Home", Icons.dashboard, 0, HomeScreen()),
          _buildSidebarTile(
              "Donor Register", Icons.favorite, 1, DonorRegisterScreen()),
          _buildSidebarTile(
              "Patient Register", Icons.group, 2, PatientRegisterScreen()),
          _buildSidebarTile("Users", Icons.people, 3, UsersScreens()),
          const Spacer(),
          const Divider(color: Color(0xFFBDBDBD)),
          _buildSidebarTile("Settings", Icons.settings, 4, null),
          _buildSidebarTile("Logout", Icons.logout, 5, null),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSidebarTile(
    String title, IconData icon, int index, Widget? screen) {
  final bool selected = _selectedIndex == index;
  final bool isPositiveAction = index == 1 || index == 2;

  return ListTile(
    selected: selected,
    tileColor: selected && isPositiveAction ? Color(0xFFE0F2F1) : null,
    leading: Icon(
      icon,
      color: selected
          ? (isPositiveAction ? Color(0xFF2A9D8F) : Color(0xFFB00020))
          : Colors.grey[700],
    ),
    title: Text(
      title,
      style: TextStyle(
        color: selected
            ? (isPositiveAction ? Color(0xFF2A9D8F) : Color(0xFFB00020))
            : Colors.black87,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      ),
    ),
    onTap: () {
      if (index == 5) {
        _logout();
        return;
      }
      setState(() {
        _selectedIndex = index;
      });
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE), 

      body: Row(
        children: [
          _buildSidebar(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null)
                    Text(
                      widget.title!,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  const SizedBox(height: 20),
                  Expanded(child: _getScreenByIndex(_selectedIndex)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
