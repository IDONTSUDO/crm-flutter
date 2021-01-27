import 'package:flutter/material.dart';
import 'package:bogdashka/components/buttons/add_button.dart';

import '../../../constants.dart';
import 'rounded_container.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      title: "Order details",
      children: [
        buildProductInfo(context),
        buildProductInfo(context),
        buildProductInfo(context),
        SizedBox(height: 5),
        // Add new product button
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
          child: FlatButton(
            minWidth: double.infinity,
            color: kBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            onPressed: () {},
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Add new product + ",
                // textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          height: 1.65,
          color: kBackgroundColor,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding * 0.75),
                child: Column(
                  children: [
                    TextField(
                      maxLines: 9,
                      keyboardType: TextInputType.multiline,
                      decoration: kFilledInputDecoration.copyWith(
                        hintText: "Add comment for order",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                    SizedBox(height: 19),
                    TextField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kBackgroundColor,
                        hintStyle: Theme.of(context).textTheme.caption,
                        hintText: "Write something...",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        suffixIcon: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          width: 60,
                          child: AddButton(
                            press: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: kDefaultPadding / 2),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(kDefaultPadding / 2),
                margin: EdgeInsets.only(right: kDefaultPadding * 0.75),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                child: Column(
                  children: [
                    buildAmountText(text: "Sub Total", amount: 1111100.89),
                    buildAmountText(text: "Service fee", amount: 50.74),
                    buildAmountText(text: "Extra", amount: 20.64),
                    buildAmountText(text: "Discount", amount: 343.67),
                    buildAmountText(text: "Bonus pay", amount: 0),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
                      height: 1.65,
                      color: Colors.white,
                    ),
                    buildAmountText(
                        text: "To pay", amount: 12800.98, isBold: true),
                    buildAmountText(text: "Cash", amount: 12800.98),
                    buildAmountText(text: "Change from", amount: 5000.00),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 0.75),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: FlatButton(
                  padding: EdgeInsets.all(kDefaultPadding),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Cancle",
                      style: TextStyle(color: kRedColor),
                    ),
                  ),
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Expanded(
                flex: 3,
                child: FlatButton.icon(
                  padding: EdgeInsets.all(kDefaultPadding),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  color: kGreenColor,
                  onPressed: () {},
                  label: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.save_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kDefaultPadding / 2),
      ],
    );
  }

  Padding buildAmountText(
      {@required String text, @required double amount, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
            ),
          ),
          SizedBox(width: kDefaultPadding / 2),
          Expanded(
            child: Text(
              amount.toString(),
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }

  Container buildProductInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: 4,
      ),
      width: double.infinity,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Product #1",
              // style: Theme.of(context).textTheme.caption,
            ),
          ),
          buildWhiteDivider(),
          SizedBox(width: kDefaultPadding / 2),
          // Category Name
          SizedBox(
            width: 130,
            child: Text(
              "category Name",
              // style: TextStyle(fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          buildWhiteDivider(),
          buildCircleIconButton(
            iconData: Icons.remove,
            color: kRedColor,
            press: () {},
          ),
          Text(
            "01",
            style: Theme.of(context).textTheme.button,
          ),
          buildCircleIconButton(
            iconData: Icons.add,
            color: kGreenColor,
            press: () {},
          ),
          buildWhiteDivider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Text("1100.89"),
          ),
          buildWhiteDivider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Text("1100.89"),
          ),
          buildCircleIconButton(
            padding: EdgeInsets.zero,
            iconData: Icons.close,
            iconColor: kRedColor,
            color: Colors.transparent,
            press: () {},
          ),
        ],
      ),
    );
  }

  Container buildWhiteDivider() {
    return Container(
      height: 20,
      width: 1.64,
      color: Colors.white,
    );
  }

  Padding buildCircleIconButton({
    @required IconData iconData,
    @required VoidCallback press,
    @required Color color,
    Color iconColor = Colors.white,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
  }) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: 20,
        width: 20,
        child: FlatButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          color: color,
          onPressed: press,
          child: Icon(
            iconData,
            size: 15,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
