import 'package:doniranjeorgana_desktop/models/korisnik.dart';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/providers/korisnik_provider.dart';
import 'package:doniranjeorgana_desktop/widget/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorRegisterScreen extends StatefulWidget {
  @override
  _DonorRegisterScreenState createState() => _DonorRegisterScreenState();
}

class _DonorRegisterScreenState extends State<DonorRegisterScreen> {
  late KorisnikProvider _korisnikProvider;

  int? _brojKorisnika;
  SearchResult<Korisnik>? _korisnici;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _korisnikProvider = context.read<KorisnikProvider>();

    _fetchKorisnici();
  }

  Future<void> _fetchKorisnici() async {
    try {
      var korisniciData = await _korisnikProvider.get();
      setState(() {
        _korisnici = korisniciData;
        _brojKorisnika = korisniciData.count;
      });
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: MasterScreenWidget(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/images.jpg",
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildExpandableCard(
                        title: "Donor register - Living donor",
                        content: [
                          "...",
                        ]),
                    _buildExpandableCard(
                        title: "Donor register - Deceased donor",
                        content: [
                          "...",
                        ]),
                    _buildExpandableCard(
                        title:
                            "Donor register - Organ donation",
                        content: [
                          "...",
                        ]),
                        _buildExpandableCard(
                        title:
                            "Donor register - Already donors",
                        content: [
                          "...",
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
