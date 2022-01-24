import 'package:flutter/material.dart';

class DefaultButtonHera extends StatelessWidget {
  final String textButton;
  final bool isLoading;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Function() actionButton;
  const DefaultButtonHera({
    Key? key,
    required this.textButton,
    required this.actionButton,
    this.backgroundColor,
    this.isLoading = false,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(width ?? 280, height ?? 55),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(backgroundColor ?? Colors.green),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      onPressed: !isLoading ? actionButton : null, 
      child: isLoading
        ? const CircularProgressIndicator(color: Colors.white)
        : Text(
          textButton,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
    );
  }
}
