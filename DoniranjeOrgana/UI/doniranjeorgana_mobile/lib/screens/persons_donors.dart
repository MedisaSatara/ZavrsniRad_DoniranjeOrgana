import 'package:doniranjeorgana_mobile/widgets/background_screen.dart';
import 'package:flutter/material.dart';

class PersonsDonors extends StatefulWidget {
  @override
  _PersonsDonorsState createState() => _PersonsDonorsState();
}

class _PersonsDonorsState extends State<PersonsDonors> {
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              SizedBox(height: 24),

              _buildSection(
                title: "Who Can Be a Donor?",
                content:
                    "Organ donors are deceased persons who consented to organ donation during their lifetime, or if the closest relative consented postmortem. Under certain conditions, donation from a living person is also possible, provided it doesn't harm their health, as defined by law.",
              ),
              _buildSection(
                title: "Legal Framework",
                content:
                    "The law regulating organ donation in Bosnia and Herzegovina is the 'Law on Transplantation of Human Organs and Tissues for Therapeutic Purposes'. It defines postmortem and living donations, along with donor rights and protections.",
              ),
              _buildSection(
                title: "Health Conditions",
                content:
                    "A donor may not be completely healthy unless it's a vital organ. A doctor must evaluate the medical history. Donors are tested for diseases such as HIV or hepatitis.",
              ),
              _buildSection(
                title: "Age Considerations",
                content:
                    "People under 16 can be donors if they expressed this wish and their guardian agrees. Elderly people can donate if the organs are in good condition. For some tissues like cornea, age is not a limiting factor.",
              ),

              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color.fromARGB(255, 111, 43, 38).withOpacity(0.1),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("BACK", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87)),
            SizedBox(height: 8),
            Text(content,
                style: TextStyle(fontSize: 16), textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}
