import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: StreamBuilder(stream: Firestore.instance
          .collection('chats/o1NgRzTKYHjwkBsro2Tm/messages')
          .snapshots(), builder: (stream, streamSnapshot) {
        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        }
        final documents = streamSnapshot.data.documents;
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (ctx, index) => Container(
            padding: EdgeInsets.all(8),
            child: Text(documents[index]['text']),
          ),
        );
      },),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance.collection('chats/o1NgRzTKYHjwkBsro2Tm/messages').add({
            'text': 'This was added by clicking the button',
          });
        },
    )
      );
  }
}
