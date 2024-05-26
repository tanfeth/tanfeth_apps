import 'package:flutter/material.dart';

class Web {
  final BuildContext _context;

  Web(this._context);

  Widget width({required Widget child}) {
    double width = MediaQuery.of(_context).size.width;
    if (width > 800) width = 800;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: SizedBox(
            width: width,
            child: child,
          ),
        ),
      ],
    );
  }

  int GridCount(BuildContext context,[int initial = 1]) {
    double width = MediaQuery.of(_context).size.width;
    print(width);
    if (width < 750)
      return initial;
    else if (width < 1100)
      return initial + 1;
    else
      return initial + 2;
  }
}
