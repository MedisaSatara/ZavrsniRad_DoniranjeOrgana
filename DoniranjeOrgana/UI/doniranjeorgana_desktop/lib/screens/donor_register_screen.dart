import 'package:doniranjeorgana_desktop/models/donacija_organa.dart';
import 'package:doniranjeorgana_desktop/models/donori.dart';
import 'package:doniranjeorgana_desktop/models/korisnik.dart';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/providers/donacija_organa_provider.dart';
import 'package:doniranjeorgana_desktop/providers/donori_provider.dart';
import 'package:doniranjeorgana_desktop/providers/korisnik_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorRegisterScreen extends StatefulWidget {
  @override
  _DonorRegisterScreenState createState() => _DonorRegisterScreenState();
}

class _DonorRegisterScreenState extends State<DonorRegisterScreen> {
  late KorisnikProvider _korisnikProvider;
  late DonoriProvider _donoriProvider;
  late DonacijaOrganaProvider _donacijaOrganaProvider;

  SearchResult<Korisnik>? _korisnici;
  SearchResult<Donori>? _donori;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _korisnikProvider = context.read<KorisnikProvider>();
    _donoriProvider = context.read<DonoriProvider>();
    _donacijaOrganaProvider = context.read<DonacijaOrganaProvider>();

    _fetchKorisnici();
    _fetchDonori();
  }

  Future<void> _fetchKorisnici() async {
    try {
      var korisniciData = await _korisnikProvider.get();
      setState(() {
        _korisnici = korisniciData;
      });
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  Future<void> _fetchDonori() async {
    try {
      var donoriData = await _donoriProvider.get();
      setState(() {
        _donori = donoriData;
      });
    } catch (e) {
      print("Error fetching donor: $e");
    }
  }

  List<Donori> get livingDonors =>
      _donori?.result.where((d) => d.statusDonora == "Živi").toList() ?? [];

  List<Donori> get deceasedDonors =>
      _donori?.result.where((d) => d.statusDonora == "Deceased").toList() ?? [];

  List<Donori> get alreadyDonors => _donori?.result ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "OUR BASE\nOF ORGAN \nDONORS",
              style: TextStyle(
                color: Color(0xFF264653),
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 32),
            _buildExpandableCard(
              title: "Donor register - Living donor",
              content: livingDonors.map(_buildDonorInfo).toList(),
            ),
            _buildExpandableCard(
              title: "Donor register - Deceased donor",
              content: deceasedDonors.map(_buildDonorInfo).toList(),
            ),
            _buildExpandableCard(
              title: "Donor register - Organ donation",
              content: [],
            ),
            _buildExpandableCard(
              title: "Donor register - Already donors",
              content: alreadyDonors.map(_buildDonorInfo).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableCard({
    required String title,
    required List<Widget> content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ExpansionTile(
          leading: Icon(Icons.info_outline, color: Color(0xFFE76F51)),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF264653),
            ),
          ),
          iconColor: Color(0xFF2A9D8F),
          collapsedIconColor: Color(0xFF2A9D8F),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: content,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonorInfo(Donori d) {
    final k = d.korisnik;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("First name: ${k?.ime ?? ''}", style: _infoTextStyle),
          Text("Last name: ${k?.prezime ?? ''}", style: _infoTextStyle),
          Text("Email: ${k?.email ?? ''}", style: _infoTextStyle),
          Text("Phone number: ${d.telefon ?? ''}", style: _infoTextStyle),
          Text("Donor status: ${d.statusDonora ?? ''}", style: _infoTextStyle),
          Text("Active donor: ${d.aktivanDonor == 1 ? 'Yes' : 'No'}",
              style: _infoTextStyle),
        ],
      ),
    );
  }

  TextStyle get _infoTextStyle => TextStyle(
        color: Color(0xFF212121),
        fontSize: 14,
      );
}
