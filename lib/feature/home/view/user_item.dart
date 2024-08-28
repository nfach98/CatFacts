import 'package:cat_facts/feature/home/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 2,
            offset: Offset(.5, .5),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          ClipOval(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              user.image ?? '',
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.firstName ?? ''} ${user.lastName ?? ''}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.email ?? '',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  user.phone ?? '',
                  style: TextStyle(
                    fontSize: 12,
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
