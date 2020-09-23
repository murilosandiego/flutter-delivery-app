import 'package:flutter/material.dart';

class ItemProfileTile extends StatelessWidget {
  final String name;
  final String description;
  final IconData icon;
  final Function onTap;

  const ItemProfileTile({
    Key key,
    @required this.icon,
    @required this.name,
    @required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon),
      ),
      onTap: onTap,
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        description,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
    );
  }
}
