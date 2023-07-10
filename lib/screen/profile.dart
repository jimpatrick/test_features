import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_feature/provider/userProvider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<UserProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  if (value.following == []) {
                    return const SizedBox.shrink();
                  }
                  return Center(child: Text("$index: ${value.following[index]!.name} ${value.following[index]!.lastName}"));
                },
                separatorBuilder: (_, __) => const SizedBox(height: 3),
                itemCount: value.following.length);
          },
        ),
      ),
    );
  }
}
