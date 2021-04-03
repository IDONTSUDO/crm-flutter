import 'dart:async';

import 'package:bogdashka/components/TextLayouth4.dart';
import 'package:bogdashka/components/calculated/display.dart';
import 'package:bogdashka/components/calculated/processor.dart';
import 'package:bogdashka/controllers/key-controller.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/main.dart';
import 'package:bogdashka/models/CalclutedRobox.dart';
import 'package:bogdashka/service/CalculatorRobox.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'key-pad.dart';

// CalculdatedRobox

class CalculdatedRobox extends StatefulWidget {
  CalculdatedRobox({Key key}) : super(key: key);

  @override
  _CalculdatedRoboxState createState() => _CalculdatedRoboxState();
}

class _CalculdatedRoboxState extends State<CalculdatedRobox> {
  String _output;

  @override
  void initState() {
    KeyController.listen((event) => Processor.process(event));
    Processor.listen((data) => setState(() {
          _output = data;
        }));
    // Processor.refresh();
    super.initState();
  }

  @override
  void dispose() {
    KeyController.dispose();
    Processor.dispose();
    super.dispose();
  }

  void fn() {}
  @override
  Widget build(BuildContext context) {
    double sizeLeftCollumn = 100;
    var controllerGroup = new StreamController<ICalculatedRobox>(),
        controllerLogPass = new StreamController<ICalculatedRobox>(),
        controllerTransfer = new StreamController<ICalculatedRobox>(),
        controllerYourPay = new StreamController<ICalculatedRobox>();
    final calculatedService = CalculatedService(controllerGroup,
        controllerLogPass, controllerTransfer, controllerYourPay);

    calculatedService.init();
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Column(
        children: [Display(value: _output), KeyPad()],
      ),
      Container(width: 20),
      Flex(
        direction: Axis.vertical,
        children: [
          getCalcultedRowController(
              context,
              sizeLeftCollumn,
              calculatedService.selectionType,
              ComerceOperation.YOUR_PAY,
              'Вы платите',
              controllerYourPay),
          getCalcultedRowController(
              context,
              sizeLeftCollumn,
              calculatedService.selectionType,
              ComerceOperation.GROUP,
              'Group',
              controllerGroup),
          getCalcultedRowController(
              context,
              sizeLeftCollumn,
              calculatedService.selectionType,
              ComerceOperation.LOG_PASS,
              'Transfer',
              controllerTransfer),
          getCalcultedRowController(
              context,
              sizeLeftCollumn,
              calculatedService.selectionType,
              ComerceOperation.TRANSFER,
              'Log+Pass',
              controllerLogPass),
        ],
      )
    ]);
  }
}

//TODO: ВЕРНУСЬ ПОЗЖЕ НАВЕРНОЕ?
Widget getCalcultedRowController(
    BuildContext context,
    double size,
    void Function(ComerceOperation) fn,
    ComerceOperation operation,
    String text,
    StreamController<ICalculatedRobox> stream) {
  return StreamBuilder<ICalculatedRobox>(
      stream: stream.stream,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return buildLoadingWidget();
        }
        return Material(
            color: snapshot.data != null
                ? (snapshot.data.active == true
                    ? (darkPrimaryColor)
                    : (Colors.grey))
                : (Colors.grey),
            child: InkWell(
              onTap: () {
                print(operation);
                fn(operation);
              },
              child: Row(
                children: [
                  Container(
                    height: size,
                    width: size,
                    child: Text(
                      text,
                    ),
                  ),
                  snapshot.data != null
                      ? (TextLayouth4(snapshot.data.value))
                      : (Container())
                ],
              ),
            ));
      });
}
