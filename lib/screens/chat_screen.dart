import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flush_chat/widgets/textfield/user_input.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late User _user;
  final TextEditingController _chatTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      _user = currentUser;
    }

    //  print("${_user.email}");
    _subscribeToMessages();
  }

  _subscribeToMessages() async {
    await for (var snapshots
        in _firebaseFirestore.collection('messages').snapshots()) {
      for (var messages in snapshots.docs) {
        debugPrint(messages.data().toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                try {
                  await _auth.signOut();
                  if (mounted) Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Sign out'))
        ],
        title: const Text('Chat'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: CustomTextField(
                    icon: Icons.chat,
                    labelText: "Message",
                    textEditingController: _chatTextController),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    _firebaseFirestore.collection('messages').add({
                      'text': _chatTextController.text,
                      'sender': _user.email
                    });
                  },
                  child: const Icon(Icons.arrow_circle_right,
                      color: Colors.deepOrangeAccent),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
