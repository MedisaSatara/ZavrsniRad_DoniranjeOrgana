import 'package:doniranjeorgana_admin/screens/homescreen.dart';
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 63, 125, 137),
        automaticallyImplyLeading: false,
        title: widget.title_widget ??
            Text(
              widget.title ?? "",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
        actions: [
          _buildNavBarItems(context),
        ],
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildNavText(context, "Home", HomeScreen()),
        _buildNavText(context, "Users", HomeScreen()),
        _buildNavText(context, "Patients", HomeScreen()),
        _buildNavText(context, "Doctors", HomeScreen()),
        _buildNavText(context, "Department", HomeScreen()),
        // _buildNavText(context, "Insurance", OsiguranjeScreen()),
        _buildNavText(context, "Patient Insurance", HomeScreen()),
        _buildNavText(context, "Reports", HomeScreen()),
        _buildNavText(context, "Profile", HomeScreen()),
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
              color: Colors.white,
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
