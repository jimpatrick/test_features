import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_feature/provider/userProvider.dart';
import 'package:test_feature/screen/profile.dart';
import 'package:test_feature/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.title, super.key});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const UserProfile())),
              icon: const Icon(Icons.person, color: Colors.white, size: 40)),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<UserProvider>(builder: (context, value, child) {
            return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  bool userExist = false;
                  for (var userId in value.following) {
                    if (userId?.id == value.users[index].id) {
                      userExist = true;
                    }
                  }
                  User user = value.users[index];
                  return ListTile(
                    leading: Image.network(
                      user.urlAvatar,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(
                      "${user.name} ${user.lastName}",
                      style: const TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          if (userExist) {
                            value.remove(user);
                          } else {
                            value.add(user);
                          }
                        },
                        icon: userExist
                            ? const Icon(Icons.check)
                            : const Icon(Icons.add)),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 1),
                itemCount: value.users.length);
          }),
        ),
      ),
    );
  }
}
