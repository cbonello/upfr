import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserIdentity extends StatelessWidget {
  const UserIdentity({
    Key key,
    @required FirebaseUser user,
  })  : _user = user,
        super(key: key);

  final FirebaseUser _user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(_user.photoUrl),
          ),
          const SizedBox(width: 30.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _user.displayName,
                  style: Theme.of(context).textTheme.headline6,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  _user.email ?? '',
                  style: Theme.of(context).textTheme.subtitle2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
