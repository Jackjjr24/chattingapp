import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String userName;

  ChatPage({ required this.userName});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController messageController = TextEditingController();

  List<Map<String, dynamic>> messages=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
      ),

      body: Column(
        children: [

          Expanded(child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {

              final msg = messages[index];
              final isMe = msg['isMe'];

              return Align(
                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft ,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.blueAccent : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    msg['text'],
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),),

          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                    hintText: "Type a message...",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),

                    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
                  ),

                  SizedBox(width: 8),
    CircleAvatar(
    backgroundColor: Colors.blueAccent,
    child: IconButton(
    icon: Icon(Icons.send_outlined, color: Colors.white ),
    onPressed: () {
      if(messageController.text.isNotEmpty) {

        setState(() {
          messages.insert(0, {
            'text': messageController.text,
            'isMe' : true,
    });
        });

        messageController.clear();
    }
    },
    ),
    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

