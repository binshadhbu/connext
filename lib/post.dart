import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class PostCommentPage extends StatefulWidget {
  @override
  _PostCommentPageState createState() => _PostCommentPageState();
}

class _PostCommentPageState extends State<PostCommentPage> {
  TextEditingController _commentController = TextEditingController();
  TextEditingController _captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _captionController = TextEditingController();
  }

  @override
  void dispose() {
    _captionController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _submitPost() async {
    String caption = _captionController.text;
    await FirebaseFirestore.instance.collection('posts').add(
      {
        'caption':caption,
        'photoURL':'',
      }
    );
    //print('Caption:$caption');
    _captionController.clear();
  }
  void _submitComment() async{
    String comment = _commentController.text;
    CollectionReference comments =
    FirebaseFirestore.instance.collection('comments');
    await FirebaseFirestore.instance.collection('comments').add(
      {
        'commentText':comment,
      }
    );
    //print(comment);
    setState(() {
      comments.add(comment);
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text('JEE Community'),
        centerTitle:true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _captionController,
                decoration: InputDecoration(
                  labelText: 'Caption',
                  labelStyle: TextStyle(
                      color: Colors.white
                  ),
                ),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text('Post'),
            ),
            SizedBox(height: 32.0),
            Text(
              'Start a conversation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  color: Colors.white),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _commentController,
              /*decoration: InputDecoration(
                labelText: '',
              ),*/
              onSubmitted: (_) => _submitComment(),
            ),
            ElevatedButton(
              onPressed: _submitComment,
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
