import 'dart:ui';

import 'package:doniranjeorgana_mobile/models/donorski_formular.dart';
import 'package:doniranjeorgana_mobile/models/korisnik.dart';
import 'package:doniranjeorgana_mobile/models/pacijent.dart';
import 'package:doniranjeorgana_mobile/providers/donorski_formular_provider.dart';
import 'package:doniranjeorgana_mobile/providers/korisnik_provider.dart';
import 'package:doniranjeorgana_mobile/providers/pacijent_provider.dart';
import 'package:doniranjeorgana_mobile/providers/uloga_provider.dart';
import 'package:doniranjeorgana_mobile/screens/donorska_kartica_screen.dart';
import 'package:doniranjeorgana_mobile/screens/donorski_formular_screen.dart';
import 'package:doniranjeorgana_mobile/screens/pacijent_screen.dart';
import 'package:doniranjeorgana_mobile/screens/welcome_screen.dart';
import 'package:doniranjeorgana_mobile/utils/util.dart';
import 'package:doniranjeorgana_mobile/widgets/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late KorisnikProvider _korisnikProvider;
  late PacijentProvider _pacijentProvider;
  late UlogaProvider _ulogaProvider;
  late DonorskiFormularProvider _donorskiFormularProvider;
  List<Korisnik>? korisnikResult;
  Pacijent? pacijentData;
  DonorskiFormular? ispunjenFormular;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _korisnikProvider = context.read<KorisnikProvider>();
    _ulogaProvider = context.read<UlogaProvider>();
    _pacijentProvider = context.read<PacijentProvider>();
    _donorskiFormularProvider = context.read<DonorskiFormularProvider>();
    _fetchKorisnici();
  }

  @override
  void initState() {
    super.initState();
    _korisnikProvider = Provider.of<KorisnikProvider>(context, listen: false);
    _pacijentProvider = Provider.of<PacijentProvider>(context, listen: false);
    _fetchKorisnici();
  }

  Future<void> _fetchKorisnici() async {
    try {
      var data = await _korisnikProvider.get();
      var filtered = data.result.where((korisnik) {
        return korisnik.korisnikUlogas.any((uloga) => uloga.ulogaId == 2);
      }).toList();

      setState(() {
        korisnikResult = filtered;
      });

      if (filtered.isNotEmpty) {
        var korisnikId = filtered.first.korisnikId;
        var pacijentiData = await _pacijentProvider.get();

        var matchedPacijent = pacijentiData.result.firstWhere(
          (p) => p.korisnikId == korisnikId,
        );

        if (matchedPacijent != null) {
          setState(() {
            pacijentData = matchedPacijent;
          });
        }
      }
    } catch (e) {
      print('Greška prilikom dohvaćanja korisnika ili pacijenta: $e');
    }
  }

  void _launchURL() async {
    final Uri url =
        Uri.parse('https://github.com/MedisaSatara/ZavrsniRad_DoniranjeOrgana');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
  void _logout() {
    Authorization.korisnik = null;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget(
      title: 'Organ4Life',
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHomePage(),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(value ?? '-',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    final korisnik = korisnikResult?.first;

    if (korisnik == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.waving_hand,
                  color: const Color.fromARGB(255, 190, 36, 25), size: 32),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Welcome, ${korisnik.ime} ${korisnik.prezime}!',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Thanks for considering a donation! Your decision can save lives.',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey[700],
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildIconButton(
                icon: Icons.person,
                label: 'My data',
                onTap: () {
                  if (pacijentData != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PacijentPodaciScreen(pacijent: pacijentData!),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Podaci o pacijentu nisu dostupni.')),
                    );
                  }
                },
              ),
              _buildIconButton(
                icon: Icons.favorite,
                label: 'Become a donor',
                onTap: () {
                  if (pacijentData != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DonorskiFormularScreen(
                          korisnikIme:
                              '${pacijentData?.ime} ${pacijentData?.prezime}',
                        ),
                      ),
                    );
                  }
                },
              ),
              _buildIconButton(
                icon: Icons.info,
                label: 'Donor card',
                onTap: () {
                  if (pacijentData != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            DonorskaKarticaScreen(pacijent: pacijentData!),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Podaci o pacijentu nisu dostupni.')),
                    );
                  }
                },
              ),
              _buildIconButton(
                icon: Icons.contact_mail,
                label: 'Associations',
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 32),
          GestureDetector(
            onTap: _launchURL,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 181, 144, 142),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'One decision. One life. Be a hero today.',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/organdonor.jpg",
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      splashColor: const Color.fromARGB(255, 190, 36, 25).withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: const Color.fromARGB(255, 190, 36, 25)),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationCard({
    required String title,
    required VoidCallback onTap,
  }) {
    List<String> words = title.split(' ');
    String firstWord = words.length > 1 ? words[0] : title;
    String secondWord = words.length > 1 ? words[1] : '';

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white.withOpacity(0.95),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (secondWord.isNotEmpty)
                Column(
                  children: [
                    Text(
                      firstWord,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      secondWord,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              else
                Text(
                  firstWord,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
