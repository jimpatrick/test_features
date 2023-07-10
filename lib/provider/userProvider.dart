import 'package:flutter/material.dart';
import 'package:test_feature/model/user.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _following = [];

  List<User?> get following => _following;

  add(User addUser) {
    _following.add(addUser);
    notifyListeners();
  }

  remove(User rmUser) {
    _following.removeWhere((user) => user.id == rmUser.id);
    notifyListeners();
  }

  List<User> users = [
    User(0, 'Markus', 'Odom', 'https://picsum.photos/seed/x1/40/40'),
    User(1, 'Maia', 'Diaz', 'https://picsum.photos/seed/x2/40/40'),
    User(2, 'Harold', 'Castro', 'https://picsum.photos/seed/x3/40/40'),
    User(3, 'Barnaby', 'Benton', 'https://picsum.photos/seed/x4/40/40'),
    User(4, 'Alison', 'Donaldson', 'https://picsum.photos/seed/x5/40/40'),
    User(5, 'Delores', 'Buckley', 'https://picsum.photos/seed/x6/40/40'),
    User(6, 'Leslie', 'Mckinney', 'https://picsum.photos/seed/x7/40/40'),
    User(7, 'Lula', 'Pham', 'https://picsum.photos/seed/x8/40/40'),
    User(8, 'Nora', 'Carroll', 'https://picsum.photos/seed/x9/40/40'),
    User(9, 'Herbie', 'Chandler', 'https://picsum.photos/seed/x10/40/40'),
  ];
}