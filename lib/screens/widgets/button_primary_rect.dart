import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPrimaryRound extends StatelessWidget {
  const ButtonPrimaryRound({
    required this.btnName,
    required this.isOutlineButton,
    required this.onBtnClick,
    this.icon,
    required this.colors,
  });

  final String btnName;
  final bool isOutlineButton;
  final IconData? icon;
  final VoidCallback onBtnClick;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            isOutlineButton ? Colors.white : colors),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: isOutlineButton
                ? BorderSide(color: colors)
                : BorderSide(color: colors),
          ),
        ),
      ),
      onPressed: onBtnClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: isOutlineButton ? colors : Colors.white,
                  )
                : Container(),
            icon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      btnName,
                      style: TextStyle(
                        color: isOutlineButton ? colors : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : Text(
                    btnName,
                    style: TextStyle(
                      color: isOutlineButton ? colors : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
