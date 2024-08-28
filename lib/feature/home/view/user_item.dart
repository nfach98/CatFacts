import 'package:cat_facts/feature/home/model/user.dart';
import 'package:flutter/widgets.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
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
                ),
                Text(
                  user.email ?? '',
                ),
                Text(
                  user.phone ?? '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
