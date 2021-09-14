import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr/themes/appStyleConfig.dart';

class AdminLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Admin"),
        backgroundColor: AppStyleConfig.primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: AppStyleConfig.accentColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('locations').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('It error');
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(doc['locationName']),
                    subtitle: Row(
                      children: [
                        Expanded(child: Text(doc['LATITUDE'])),
                        Expanded(child: Text(doc['LONGITUDE'])),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
