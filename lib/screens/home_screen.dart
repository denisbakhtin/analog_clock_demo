import 'package:analog_clock_demo/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Settings.svg',
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () => null,
        ),
        actions: [
          buildActionButton(context),
        ],
      ),
      body: Body(),
    );
  }

  Padding buildActionButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: InkWell(
        onTap: () => null,
        child: Container(
          width: getProportionateScreenWidth(32),
          decoration: BoxDecoration(
            color: Theme.of(context).iconTheme.color,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
