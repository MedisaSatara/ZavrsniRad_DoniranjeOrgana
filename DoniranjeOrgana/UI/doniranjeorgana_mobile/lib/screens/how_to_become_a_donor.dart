import 'package:doniranjeorgana_mobile/widgets/background_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HowToBecomeADonorScreen extends StatefulWidget {
  @override
  _HowToBecomeADonorScreenState createState() =>
      _HowToBecomeADonorScreenState();
}

class _HowToBecomeADonorScreenState extends State<HowToBecomeADonorScreen> {
  final List<Map<String, dynamic>> _sections = [
    {
      "icon": Icons.how_to_reg,
      "title": "Registration",
      "description":
          "If a person wants to be a donor, the process is simple, and in most countries it is done by registering on official health websites. "
          "In many countries, people are given forms to fill out as their voluntary decision to join the organ donor list, or through a donor card. "
          "It is important to inform family members of the decision so that their wishes can be respected even after their death.",
    },
    {
      "icon": Icons.gavel,
      "title": "Legal Conditions",
      "description":
          "The conditions for living organ donation are regulated by the law of each country, which mainly boil down to the following:\n\n"
          "- The person who wants to donate the organ(s) must be of legal age and capable of consent;\n"
          "- The person who wants to donate the organ(s) must give their consent;\n"
          "- The person who wants to donate the organ(s) must be informed of all the risks;\n"
          "- The person who wants to donate the organ(s) must be suitable as a donor according to medical assessment.",
    },
    {
      "icon": Icons.login,
      "title": "Become a Donor",
      "description":
          "Click here to Login and fill out the form to be organ donor.",
      "isLink": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
     return BackgroundScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Organ4Life",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildIntroText(),
            SizedBox(height: 8),
            ..._sections.map((section) => _buildInfoCard(section)).toList(),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 111, 43, 38).withOpacity(0.1),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  child: Text("BACK", style: TextStyle(color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildImageHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            "assets/images/Organ4Life.jpg",
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildIntroText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Key facts before you officially become a donor:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:const Color.fromARGB(255, 111, 43, 38),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Learn how you can save lives by becoming a donor. Follow these key steps and requirements.",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(Map<String, dynamic> section) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.red[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(section['icon'], size: 40, color: Colors.red[400]),
              SizedBox(height: 12),
              Text(
                section['title'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              section['isLink'] == true
                  ? RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(text: "Click "),
                          TextSpan(
                            text: "here",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/login');
                              },
                          ),
                          TextSpan(text: " to login and fill out the form to be organ donor."),
                        ],
                      ),
                    )
                  : Text(
                      section['description'],
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
