import 'package:doniranjeorgana_mobile/widgets/background_screen.dart';
import 'package:flutter/material.dart';
import 'package:doniranjeorgana_mobile/screens/about_organ_donor.dart';
import 'package:doniranjeorgana_mobile/screens/how_to_become_a_donor.dart';
import 'package:doniranjeorgana_mobile/screens/legalities.dart';
import 'package:doniranjeorgana_mobile/screens/persons_donors.dart';
import 'package:doniranjeorgana_mobile/main.dart';
import 'package:signature/signature.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Map<String, bool> switches = {
    "About Organ Donor": false,
    "Persons Donors": false,
    "Legalities": false,
    "Become a Donor": true,
  };

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildCustomButton({
    required String label,
    required VoidCallback onPressed,
    required String keyName,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.arrow_forward_ios,
              color: const Color.fromARGB(255, 190, 36, 25), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.zero,
                foregroundColor: Colors.black,
                backgroundColor: Colors.transparent,
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Switch(
            value: switches[keyName] ?? false,
            onChanged: (val) {
              setState(() {
                switches[keyName] = val;
              });
            },
            activeColor:Color.fromARGB(255, 112, 14, 14),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Organ4Life",
          style: TextStyle(
            color:Color.fromARGB(255, 112, 14, 14),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/Organ4Life.jpg"),
            ),
            const SizedBox(height: 40),
            Text(
              '“The best way to find yourself is to lose yourself in the service of others. – Mahatma Gandhi. It highlights the selflessness of organ donation."',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 112, 14, 14),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            buildCustomButton(
              label: "About Organ Donor",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AboutOrganDonorScreen()),
              ),
              keyName: "About Organ Donor",
            ),
            buildCustomButton(
              label: "Persons Donors",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PersonsDonors()),
              ),
              keyName: "Persons Donors",
            ),
            buildCustomButton(
              label: "Legalities",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LegalitiesScreen()),
              ),
              keyName: "Legalities",
            ),
            buildCustomButton(
              label: "Become a Donor",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HowToBecomeADonorScreen()),
              ),
              keyName: "Become a Donor",
            ),
            const SizedBox(height: 40),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
              icon: Icon(Icons.login_outlined,
                  color: Color.fromARGB(255, 112, 14, 14), size: 26),
              label: Text(
                "Login",
                style: TextStyle(
                  color: Color.fromARGB(255, 112, 14, 14),
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
