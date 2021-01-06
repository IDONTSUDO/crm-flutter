import 'package:flutter/material.dart';
import 'package:flutter_google_places_web/flutter_google_places_web.dart';
import 'package:get/get.dart';

import '../../../components/buttons/rounded_icon_button.dart';
import '../../../constants.dart';
import 'google_map.dart';

Dialog buildAddNewLocationDialog() {
  return Dialog(
    backgroundColor: Colors.white,
    child: Container(
      width: Get.width * 0.75,
      height: Get.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFF0F8EF),
              borderRadius: const BorderRadius.all(Radius.circular(14)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: RoundedIconButton(
                    svgSrc: "assets/icons/location_edit.svg",
                    press: () {},
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: FlutterGooglePlacesWeb(
                    apiKey: "AIzaSyAoDHJtOn52c7myGHGPHke5vxNWqCOuoWE",
                    proxyURL: 'https://jetti-cors-anywhere.herokuapp.com/',
                    components: 'country:bd',
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your location",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: CloseButton(),
                ),
              ],
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              GleMap(),
              Positioned(
                bottom: kDefaultPadding,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 2),
                  child: FlatButton.icon(
                    padding: EdgeInsets.all(kDefaultPadding),
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    minWidth: double.infinity,
                    color: kGreenColor,
                    icon: Icon(
                      Icons.save_alt,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Save new location",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    ),
  );
}
