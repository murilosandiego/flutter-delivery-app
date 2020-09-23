import 'package:flutter/material.dart';

class ItemDataTile extends StatelessWidget {
  final String name;
  final String description;
  final Function onTap;
  final bool disableText;

  const ItemDataTile({
    Key key,
    @required this.name,
    @required this.description,
    this.onTap,
    this.disableText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
