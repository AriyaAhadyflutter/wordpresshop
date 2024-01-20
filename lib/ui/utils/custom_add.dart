import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomQuantity extends StatefulWidget {
  final int minNumber;
  final int maxNumber;
  final double iconSize;
  int value;
  final ValueChanged onChange;

  CustomQuantity({
    super.key,
    required this.minNumber,
    required this.maxNumber,
    required this.iconSize,
    required this.value,
    required this.onChange,
  });

  @override
  State<CustomQuantity> createState() => _CustomQuantityState();
}

class _CustomQuantityState extends State<CustomQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              widget.value = widget.value == widget.minNumber
                  ? widget.minNumber
                  : widget.value -= 1;
              widget.onChange(widget.value);
            });
          },
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: widget.iconSize,
          child: Text(
            '${widget.value}',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                widget.value = widget.value == widget.maxNumber
                    ? widget.maxNumber
                    : widget.value += 1;
                widget.onChange(widget.value);
              });
            },
            icon: const Icon(Icons.add),)
      ],
    );
  }
}
