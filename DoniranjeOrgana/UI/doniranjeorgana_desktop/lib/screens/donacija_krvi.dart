import 'dart:convert';

import 'package:doniranjeorgana_desktop/providers/base_provider.dart';
import 'package:doniranjeorgana_desktop/providers/donacija_krvi_provider.dart';
import 'package:doniranjeorgana_desktop/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DonacijaKrviScreen extends StatefulWidget {
  @override
  _DonacijaKrviScreenState createState() => _DonacijaKrviScreenState();
}

class _DonacijaKrviScreenState extends State<DonacijaKrviScreen> {
  late DonacijaKrviProvider _donacijaKrviProvider;
  final TextEditingController _krvnaGrupaController = TextEditingController();
  String? _responseMessage;
  bool _isLoading = false;

 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _donacijaKrviProvider = context.read<DonacijaKrviProvider>();
  }

  Future<void> _posaljiMail() async {
    final krvnaGrupa = _krvnaGrupaController.text.trim();
    if (krvnaGrupa.isEmpty) {
      setState(() {
        _responseMessage = 'Unesite krvnu grupu.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _responseMessage = null;
    });

    try {
      final message = await _donacijaKrviProvider.posaljiMail(krvnaGrupa);
      setState(() {
        _isLoading = false;
        _responseMessage = message;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _responseMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pošalji Email Donorima')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _krvnaGrupaController,
              decoration: InputDecoration(labelText: 'Unesite krvnu grupu'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _posaljiMail,
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Pošalji Email'),
            ),
            SizedBox(height: 20),
            if (_responseMessage != null)
              Text(
                _responseMessage!,
                style: TextStyle(
                  color: _responseMessage!.startsWith('Greška')
                      ? Colors.red
                      : Colors.green,
                ),
              )
          ],
        ),
      ),
    );
  }
}
