import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';

class ProfileTile extends StatelessWidget {
  final FontWeight fontWeight;
  final IconData icon;
  final Function onTap;

  const ProfileTile({Key key, this.fontWeight, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthStore>(
      builder: ($) => ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(
            $.user != null ? $.user.name[0] : '',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          $.user != null ? $.user.name : '',
          style: TextStyle(fontWeight: fontWeight ?? FontWeight.w400),
        ),
        subtitle: Text(
          'Editar perfil',
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}
