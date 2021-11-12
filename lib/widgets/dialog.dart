import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  final String entity;
  final String entitytype;
  const PopUp({Key? key, required this.entity, required this.entitytype})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: Text('$entity will be deleted permanently.'),
      actions: [
        TextButton(
            onPressed: () async {
              Navigator.pop(context, true);
              print(entitytype);
              //await compute(delete, entitytype);
              //print('Done');
            },
            child: const Text('Yes')),
        TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'))
      ],
    );
  }
}
