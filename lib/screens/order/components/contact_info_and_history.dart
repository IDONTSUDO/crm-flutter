import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'contact_info_card.dart';
import 'rounded_container.dart';

class ContactInfoAndHistory extends StatelessWidget {
  const ContactInfoAndHistory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: ContactInfoCard(),
          ),
          Container(
            color: kBackgroundColor,
            width: 1.64,
          ),
          // History

          Expanded(
            flex: 4,
            child: RoundedContainer(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(13),
                bottomRight: Radius.circular(13),
              ),
              title: "History",
              children: [
                buildHistory(
                    date: "22.12.2020", text: "ORDER 355286", press: () {}),
                buildHistory(
                    date: "22.12.2020", text: "ORDER 355286", press: () {}),
                buildHistory(
                    date: "22.12.2020", text: "ORDER 355286", press: () {}),
                buildHistory(
                    date: "22.12.2020", text: "ORDER 355286", press: () {}),
                Expanded(
                  child: FlatButton(
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        // bottomLeft: Radius.circular(13),
                        bottomRight: Radius.circular(13),
                      ),
                    ),
                    color: Colors.white,
                    onPressed: () {},
                    child: Text(
                      "See all",
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildHistory({
    @required String date,
    @required String text,
    @required VoidCallback press,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kBackgroundColor, width: 1.64),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(date, maxLines: 1),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: press,
              child: Text(
                text,
                maxLines: 1,
                // textDirection: Texdi,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          )
        ],
      ),
    );
  }
}
