import 'package:flutter/material.dart';
import 'package:test_app/screens/ChatPage.dart';

import 'custom_search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List menuItems = [
    "New Group",
    "New Broadcast",
    "Linked devices",
    "Starred message",
    "Payment",
    "Settings"
  ];
  List chats = [
    {
      "name": "Ram",
      "Message": "I have reached Lanka",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Lakshman",
      "Message": "Bhrata, mujhe aadesh dein, sabko mai akele maar dunga!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Bharat",
      "Message": "Kila fateh karke aaiye! Rajya aapka intezar kar raha hai!",
      "time": "11:15",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Shatrughna",
      "Message": "ALl the best bhrata shree!",
      "time": "11:12",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Hanuman",
      "Message": "Jai Shree Ram. On your command, my lord!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Sita",
      "Message": "I am waiting, Come soon!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": true,
      "sent": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("What's UP"),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                    icon: const Icon(Icons.search),
                  ),
                  PopupMenuButton<String>(
                      onSelected: (value) => {print(value)},
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                            const PopupMenuItem(
                              value: "New Group",
                              child: Text("New Group"),
                            ),
                            const PopupMenuItem(
                              value: "New Broadcast",
                              child: Text("New Broadcast"),
                            ),
                            const PopupMenuItem(
                              value: "Linked devices",
                              child: Text("Linked devices"),
                            ),
                            const PopupMenuItem(
                              value: "Starred message",
                              child: Text("Starred message"),
                            ),
                            const PopupMenuItem(
                              value: "Payment",
                              child: Text("Payment"),
                            ),
                            const PopupMenuItem(
                              value: "Settings",
                              child: Text("Settings"),
                            ),
                          ])
                ],
              ),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(chats[index]["name"]),
                subtitle: chats[index]["sent"]
                    ? Row(
                        children: [
                          const Icon(Icons.done_all),
                          Text(
                            chats[index]["Message"],
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      )
                    : Text(
                        chats[index]["Message"],
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: index % 2 == 0
                      ? Image.asset("assets/srk.png")
                      : Image.asset("assets/srk1.png"),
                ),
                trailing: Text(chats[index]["time"]),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ChatPage(
                    name: chats[index]["name"],
                    image:
                        index % 2 == 0 ? "assets/srk.png" : "assets/srk1.png",
                  );
                })),
              );
            }));
  }
}
