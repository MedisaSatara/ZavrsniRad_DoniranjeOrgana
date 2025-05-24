import 'package:doniranjeorgana_desktop/screens/donor_register_screen.dart';
import 'package:doniranjeorgana_desktop/screens/home_screen.dart';
import 'package:doniranjeorgana_desktop/screens/korisnici_screen.dart';
import 'package:doniranjeorgana_desktop/screens/patient_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MasterScreenWidget extends StatefulWidget {
  Widget? child;
  String? title;
  Widget? title_widget;
  MasterScreenWidget({this.child, this.title, this.title_widget, Key? key})
      : super(key: key);

  @override
  State<MasterScreenWidget> createState() => _MasterScreenWidgetState();
}

class _MasterScreenWidgetState extends State<MasterScreenWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: SafeArea(
              child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Organ4Life.jpg',
                          height: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Organ4Life",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Admin",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.account_circle,
                            color: Colors.black87, size: 28),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: _buildNavBarItems(context),
              ),
            ],
          )),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: widget.child!),
        ],
      ),
    );
  }

  Widget _buildNavBarItems(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNavText(context, "Home", HomeScreen()),
        _buildNavText(context, "Donor register", DonorRegisterScreen()),
        _buildNavText(context, "Patient register", PatientRegisterScreen()),
        _buildNavText(context, "Users", UsersScreens()),
      ],
    );
  }

  Widget _buildNavText(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        onHover: (isHovered) {
          setState(() {});
        },
        child: MouseRegion(
          onEnter: (_) {
            setState(() {});
          },
          onExit: (_) {
            setState(() {});
          },
          child: Text(
            title,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
