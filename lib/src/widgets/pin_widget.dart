import 'package:flutter/material.dart';
import 'package:flutter_paystack/src/widgets/base_widget.dart';
import 'package:flutter_paystack/src/widgets/common/extensions.dart';
import 'package:flutter_paystack/src/widgets/common/space.dart';
import 'package:flutter_paystack/src/widgets/custom_dialog.dart';
import 'package:flutter_paystack/src/widgets/input/pin_field.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_animations/src/animation_configuration.dart';

import 'buttons.dart';

class PinWidget extends StatefulWidget {
  @override
  _PinWidgetState createState() => _PinWidgetState();
}

class _PinWidgetState extends BaseState<PinWidget> {
  var heightBox = const SizedBox(height: 20.0);

  @override
  void initState() {
    confirmationMessage = 'Do you want to cancel PIN input?';
    super.initState();
  }

  @override
  Widget buildChild(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 700),
        childAnimationBuilder: (widget) => SlideAnimation(
          horizontalOffset: -50.0,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: [
          SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                child: Text(
                  'To confirm you\'re the owner of this card, please '
                  'enter your card pin.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: context.textTheme().headline6?.color,
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              VerticalSpacing(eqH(8, screenHeight)),
              new PinField(
                  onSaved: (String pin) => Navigator.of(context).pop(pin)),
              heightBox,
              new WhiteButton(
                onPressed: onCancelPress,
                text: 'Cancel',
                flat: true,
                bold: true,
              ),
            ],
          ),
        ],
      ),
    );
    // return new CustomAlertDialog(
    //   content: new SingleChildScrollView(
    //     child: new Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           buildStar(),
    //           heightBox,
    //           Text(
    //             'To confirm you\'re the owner of this card, please '
    //             'enter your card pin.',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontWeight: FontWeight.w500,
    //               color: context.textTheme().headline6?.color,
    //               fontSize: 15.0,
    //             ),
    //           ),
    //           heightBox,

    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget buildStar() {
    Icon star(Color color) => new Icon(
          Icons.star,
          color: color,
          size: 12.0,
        );

    return new Container(
      padding: const EdgeInsets.fromLTRB(6.0, 15.0, 6.0, 6.0),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: const BorderRadius.all(Radius.circular(5.0))),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
            _startCount,
            (i) => star(i == (_startCount - 1)
                ? context.colorScheme().secondary
                : Theme.of(context).primaryColorLight)),
      ),
    );
  }
}

const _startCount = 4;
