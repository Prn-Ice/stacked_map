import 'package:flutter/material.dart';
import 'package:stacked_map/common/helper_widgets/ui_helpers.dart';

class Mock2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Building Mock 2');
    return ListView.separated(
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text('I '
              'real${'l' * index}y'
              ' Need Help'),
        ),
      ),
      separatorBuilder: (context, index) => verticalSpace(20),
      itemCount: 20,
    );
  }
}
