import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jetti/components/buttons/add_button.dart';
import 'package:jetti/components/buttons/rounded_icon_button.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import 'add_new_location_dialog.dart';
import 'rounded_container.dart';
import '../../../extensions.dart';

class UserCurrentAddress extends StatelessWidget {
  const UserCurrentAddress({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      title: "Clients current address",
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(13),
      ),
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
          child: Row(
            children: [
              Icon(
                Icons.pin_drop,
                color: kDefualtIconColor,
                size: 20,
              ),
              SizedBox(width: kDefaultPadding / 2),
              Expanded(
                child:
                    Text("Komsomolsk-on-Amur, 34/5 Khanty free Mansiyskaya st"),
              ),
            ],
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
          child: Row(
            children: [
              Icon(Icons.home),
              SizedBox(width: kDefaultPadding / 2),
              SizedBox(
                width: 70,
                child: Text(
                  "145",
                  textAlign: TextAlign.center,
                ).filledText(),
              ),
              SizedBox(width: kDefaultPadding),
              WebsafeSvg.asset("assets/icons/building_car.svg"),
              SizedBox(width: kDefaultPadding / 2),
              SizedBox(
                width: 70,
                child: Text(
                  "4",
                  textAlign: TextAlign.center,
                ).filledText(),
              ),
              Spacer(),
              RoundedIconButton(
                svgSrc: "assets/icons/location_edit.svg",
                press: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
          child: Row(
            children: [
              Icon(Icons.stairs),
              SizedBox(width: kDefaultPadding / 2),
              SizedBox(
                width: 70,
                child: Text(
                  "9",
                  textAlign: TextAlign.center,
                ).filledText(),
              ),
              Spacer(),
              RoundedIconButton(
                svgSrc: "assets/icons/location_add.svg",
                press: () {
                  showDialog(
                    context: context,
                    builder: (context) => buildAddNewLocationDialog(),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New address"),
              Text("GEO ok"),
              Text("Delivery zone 1, free from 500RUB, 55+"),
            ],
          ),
        ),
        // SizedBox(height: kDefaultPadding),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 0.75),
          child: TextField(
            style: TextStyle(fontSize: 14),
            decoration: kFilledInputDecoration.copyWith(
              hintText: "Write something for the delvery man...",
              suffixIcon: Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: 60,
                child: AddButton(
                  press: () {},
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
