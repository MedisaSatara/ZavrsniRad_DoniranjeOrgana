import 'package:doniranjeorgana_mobile/screens/korisnik_screen.dart';
import 'package:doniranjeorgana_mobile/screens/welcome_screen.dart';
import 'package:doniranjeorgana_mobile/utils/util.dart';
import 'package:flutter/material.dart';

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
  int _selectedIndex = 0;
  final GlobalKey _menuKey = GlobalKey();


  final List<Widget> _mainScreens = [
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white,
                Color.fromARGB(255, 221, 213, 214),
                Color.fromARGB(255, 181, 144, 142),
                Color.fromARGB(255, 148, 109, 106),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: widget.title_widget ??
                Text(
                  widget.title ?? "",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 112, 14, 14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
            actions: [
              IconButton(
                key: _menuKey,
                icon: const Icon(Icons.menu),
                color: Colors.white,
                onPressed: () async {
                  final RenderBox button =
                      _menuKey.currentContext!.findRenderObject() as RenderBox;
                  final RenderBox overlay = Overlay.of(context)
                      .context
                      .findRenderObject() as RenderBox;

                  final Offset position =
                      button.localToGlobal(Offset.zero, ancestor: overlay);
                  final RelativeRect rect = RelativeRect.fromLTRB(
                    position.dx,
                    position.dy + button.size.height,
                    position.dx + button.size.width,
                    0,
                  );

                  final selected = await showMenu<String>(
                    context: context,
                    position: rect,
                    items: const [
                      PopupMenuItem<String>(
                        value: 'settings',
                        child: Text('Settings'),
                      ),
                      PopupMenuItem<String>(
                        value: 'logout',
                        child: Text('Logout'),
                      ),
                    ],
                  );

                  if (selected == 'settings') {
                    print('Otvoriti Settings');
                  } else if (selected == 'logout') {
                    _logout();
                  }
                },
              ),
            ],
          ),
          body: widget.child ?? _mainScreens[_selectedIndex],
          bottomNavigationBar: SizedBox(
            height: 50,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 205, 190, 190),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 190, 36, 25),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _logout() {
    Authorization.korisnik = null;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
      (route) => false,
    );
  }
}
