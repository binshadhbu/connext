import 'package:flutter/material.dart';

class PostCommentNeet extends StatefulWidget {
  @override
  _PostCommentNeetState createState() => _PostCommentNeetState();
}

class _PostCommentNeetState extends State<PostCommentNeet> {
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

  void _submitPost(){
    String caption = _captionController.text;
    print('Caption:$caption');
  }
  void _submitComment() {
    String comment = _commentController.text;
    // Here you can perform any logic to submit the comment to your backend or process it as needed
    // For this example, we'll simply print the comment
    print(comment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text('NEET Community'),
        centerTitle:true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/choose.jpeg'), // set the image path here
            fit: BoxFit.cover, // set the fit property to cover or contain
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _captionController,
                decoration: InputDecoration(
                  labelText: 'Caption',
                  labelStyle: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  color: Colors.black45),
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
      ),
    );
  }
}
