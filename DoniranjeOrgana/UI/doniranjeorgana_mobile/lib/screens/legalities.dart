import 'package:doniranjeorgana_mobile/widgets/background_screen.dart';
import 'package:flutter/material.dart';

class LegalitiesScreen extends StatefulWidget {
  @override
  _LegalitiesScreenState createState() => _LegalitiesScreenState();
}

class _LegalitiesScreenState extends State<LegalitiesScreen> {
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
        child: Column(
          children: [
            SizedBox(height: 24),
            _buildExpandableCard(title: "Living person donor", content: [
              " During life, a person should decide for themselves whether they want to be part of this process. A living person can donate organs and blood if it does not harm their health, as determined by the law of each country.",
              "A person is included in the list of organ donors, in accordance with the legal provisions of a particular country and his will expressed during his lifetime. Most often, in such a case, a kidney is donated, because it is possible to live normally and healthily with one kidney.",
              "Living organ donation is only possible if the donor and recipient are close relatives or friends with the necessary genetic match. This is the case when it comes to first or second degree relatives, fiancés, registered life partners or people in a close personal relationship.",
            ]),
            _buildExpandableCard(title: "Living donor insurance", content: [
              "The donor's costs are covered by the recipient's health insurance. Before the transplant, the health insurance company informs the donor and the recipient of the organ.",
              "The Health Insurance Act stipulates that a living donor has a direct right to treatment from the organ recipient's statutory health insurance, regardless of his or her insurance status. This treatment includes outpatient and inpatient treatment, pre- and post-hospital medical care, rehabilitation services, sick leave benefits and necessary travel expenses.",
              "The Health Insurance Act stipulates that a living donor has a direct right to treatment from the organ recipient's statutory health insurance, regardless of his or her insurance status. This treatment includes outpatient and inpatient treatment, pre- and post-hospital medical care, rehabilitation services, sick leave benefits and necessary travel expenses.",
              "If the recipient has private health insurance, their insurance will also cover the organ donor, which is regulated by a voluntary declaration. If necessary, another insurer, such as an aid office, can be involved, which will cover the costs proportionately.",
            ]),
            _buildExpandableCard(
                title:
                    "Law on Organ and Tissue Transplantation for Therapeutic Purposes",
                content: [
                  "...",
                ]),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color.fromARGB(255, 111, 43, 38).withOpacity(0.1),
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

  Widget _buildExpandableCard({
    required String title,
    required List<String> content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ExpansionTile(
          leading: Icon(Icons.info_outline, color: Colors.redAccent),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.add, color: Colors.black),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: content
                    .map((paragraph) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            paragraph,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 16),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
