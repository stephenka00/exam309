
import 'package:flutter/material.dart';
import 'package:Exam309/lib/services/api_service.dart';
import 'package:Exam309/lib/models/place.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Place> _places = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadPlaces();
  }

  Future<void> _loadPlaces() async {
    setState(() {
      _isLoading = true;
    });
    final places = await ApiService.getAllPlaces();
    setState(() {
      _places = places;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : _places.isEmpty
          ? Center(
        child: Text('No places available'),
      )
          : ListView.builder(
        itemCount: _places.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_places[index].name),
              subtitle: Text(_places[index].description),
              leading: Image.network(_places[index].imageUrl),
            ),
          );
        },
      ),
    );
  }
}