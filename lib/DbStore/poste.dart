import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String message;

  final int timepublise;

  final String username;
  final String postId;

  Post({
    required this.message,
    required this.postId,
    required this.username,
    required this.timepublise,
  });
  Map<String, dynamic> tomap() => {
        'Message': message,
        'Timepublise': timepublise,
        'postId': postId,
        'username': username,
      };
  static Post fromjson(DocumentSnapshot snap) {
    var snapshort = snap.data() as Map<String, dynamic>;
    return Post(
      message: snapshort['message'],
      postId: snapshort['postId'],
      username: snapshort['username'],
      timepublise: snapshort['Timepublise'],
    );
  }
}
