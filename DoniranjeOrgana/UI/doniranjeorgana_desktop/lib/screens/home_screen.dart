import 'package:doniranjeorgana_desktop/models/korisnik.dart';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/providers/korisnik_provider.dart';
import 'package:doniranjeorgana_desktop/widget/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                child: _buildCardsSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardsSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _buildWelcomeCard()),
        Expanded(
            child: Column(
          children: [
            _buildBrojKorisnikaCard(),
            SizedBox(
              height: 16,
            ),
            _buildTotalRegistratedUserCard(),
          ],
        ))
      ],
    );
  }

  Widget _buildWelcomeCard() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 400,
        child: Card(
          color: Colors.white.withOpacity(0.8),
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'ABOUT US',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalRegistratedUserCard() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        child: Card(
          color: Colors.white.withOpacity(0.8),
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Users registrated on the App:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  '$_brojKorisnika',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrojKorisnikaCard() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: 250,
        child: Card(
          color: Colors.white.withOpacity(0.8),
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'BLOOD DONATION',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
