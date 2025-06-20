import 'package:doniranjeorgana_desktop/models/donacija_krvi.dart';
import 'package:doniranjeorgana_desktop/models/donori.dart';
import 'package:doniranjeorgana_desktop/models/korisnik.dart';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/providers/donacija_krvi_provider.dart';
import 'package:doniranjeorgana_desktop/providers/donori_provider.dart';
import 'package:doniranjeorgana_desktop/providers/korisnik_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late KorisnikProvider _korisnikProvider;
  late DonoriProvider _donoriProvider;
  late DonacijaKrviProvider _donacijaKrviProvider;
  final TextEditingController _krvnaGrupaController = TextEditingController();
  String? _responseMessage;
  bool _isLoading = false;

  int? _brojKorisnika;
  int? _brojDonora;

  SearchResult<Korisnik>? _korisnici;
  SearchResult<Donori>? _donori;

  final Color primaryColor = Color(0xFFB71C1C);
  final Color secondaryColor = Color(0xFF1565C0);
  final Color backgroundCardColor = Colors.white;
  final Color textColorDark = Color(0xFF212121);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _korisnikProvider = context.read<KorisnikProvider>();
    _donoriProvider = context.read<DonoriProvider>();
    _donacijaKrviProvider = context.read<DonacijaKrviProvider>();

    _fetchKorisnici();
    _fetchDonori();
  }

  @override
  void dispose() {
    _krvnaGrupaController.dispose();
    super.dispose();
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

  Future<void> _fetchDonori() async {
    try {
      var donoriData = await _donoriProvider.get();
      setState(() {
        _donori = donoriData;
        _brojDonora = donoriData.count;
      });
    } catch (e) {
      print("Error fetching donor: $e");
    }
  }

  Future<void> _posaljiMail() async {
    final krvnaGrupa = _krvnaGrupaController.text.trim();
    if (krvnaGrupa.isEmpty) {
      if (!mounted) return;
      setState(() {
        _responseMessage = 'Unesite krvnu grupu.';
      });
      return;
    }

    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _responseMessage = null;
    });

    try {
      final message = await _donacijaKrviProvider.posaljiMail(krvnaGrupa);

      if (!mounted) return;

      setState(() {
        _isLoading = false;
        _responseMessage = null;
        _krvnaGrupaController.clear();
      });

      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email uspješno poslan!")),
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _responseMessage = 'Greška: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8F0FE),
            Color(0xFFF5F7FA),
          ],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: _buildCardsSection(),
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
              SizedBox(height: 16),
              _buildSendMailCard(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeCard() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 400,
        child: Card(
          color: backgroundCardColor,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardHeader("ABOUT US"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoTile("Number of donor card",
                        "Register donor number: ${_brojDonora ?? 0}"),
                    SizedBox(height: 12),
                    _buildInfoTile("User number",
                        "User app number: ${_brojKorisnika ?? 0}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardHeader(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2A9D8F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildInfoTile(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color:  const Color(0xFF2A9D8F), borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(12),
          child: Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: backgroundCardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5)
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            subtitle,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColorDark),
          ),
        ),
      ],
    );
  }

  Widget _buildSendMailCard() {
    return Center(
      child: GestureDetector(
        onTap: _showKrvnaGrupaDialog,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: 100,
          child: Card(
            color: backgroundCardColor,
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            child: Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.email, color: Colors.white),
                label: Text("@", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                onPressed: _showKrvnaGrupaDialog,
              ),
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
          color: backgroundCardColor,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            children: [
              _buildCardHeader("BLOOD DONATION"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Blood type in deficit\n\nAB\nA\n\nPlease, send email to donate this blood.",
                  style: TextStyle(fontSize: 14, color: textColorDark),
                  textAlign: TextAlign.center,
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showKrvnaGrupaDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Send email for blood donation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _krvnaGrupaController,
                decoration: InputDecoration(labelText: 'Blood type deficit'),
              ),
              SizedBox(height: 16),
              if (_isLoading)
                CircularProgressIndicator()
              else if (_responseMessage != null)
                Text(
                  _responseMessage!,
                  style: TextStyle(
                    color: _responseMessage!.startsWith('Greška')
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _responseMessage = null;
                  _krvnaGrupaController.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            ElevatedButton(
              onPressed: _isLoading ? null : _posaljiMail,
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              child: Text('Send'),
            ),
          ],
        );
      },
    );
  }
}
