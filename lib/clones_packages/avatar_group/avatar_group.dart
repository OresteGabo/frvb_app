import 'package:flutter/material.dart';

class AvatarGroup extends StatefulWidget {
  final List<String> imagesList;
  final double widthFactor;
  final double radius;
  final double outerRadius;
  final int? limitTo;
  final int? itemCount;
  final Widget Function(BuildContext context, int hiddenitemCount)?
      limitBuilder;
  final Color? backgroundColor;
  final Widget Function(BuildContext context, int index, String image)?
      itemBuilder;
  const AvatarGroup(
      {Key? key,
      this.limitBuilder,
      required this.imagesList,
      this.itemCount,
      this.outerRadius = 24.0,
      this.limitTo,
      this.itemBuilder,
      this.backgroundColor,
      this.widthFactor = 0.6,
      this.radius = 20.0})
      : super(key: key);

  @override
  State<AvatarGroup> createState() => _AvatarGroupState();
}

class _AvatarGroupState extends State<AvatarGroup> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.outerRadius * 2,
      ),
      /*constraints: BoxConstraints(
        minWidth: widget.itemBuilder != null
            ? 0.0
            : (widget.imagesList.length) * (2 * widget.outerRadius),
        maxHeight: widget.outerRadius * 2,
      ),*/
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (widget.limitTo != null &&
                widget.imagesList.length > (widget.limitTo ?? 0))
            ? widget.limitTo! + 1
            : widget.imagesList.length,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if ((widget.limitTo != null &&
                  widget.imagesList.length > (widget.limitTo ?? 0)) &&
              index > (widget.limitTo! + 1)) {
            return Align(
              alignment: Alignment.bottomRight,
              widthFactor: widget.widthFactor,
              child: CircleAvatar(
                radius: widget.outerRadius,
                backgroundImage: const AssetImage("assets/bg_dk.png"),
                //backgroundColor: widget.backgroundColor ?? Colors.green,
                child: widget.limitBuilder != null
                    ? widget.limitBuilder!(
                        context, widget.imagesList.length - widget.limitTo!)
                    : Text("+${widget.imagesList.length - widget.limitTo!}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            );
          } else {
            return Align(
              alignment: Alignment.bottomRight,
              widthFactor: widget.widthFactor,
              child: widget.itemBuilder != null
                  ? widget.itemBuilder!(
                      context, index, widget.imagesList[index])
                  : CircleAvatar(
                      radius: widget.outerRadius,
                      backgroundColor: widget.backgroundColor ??
                          Colors.green, //,context.accentColor,
                      child: CircleAvatar(
                        radius: widget.radius,
                        //backgroundImage: ImageAsset(widget.imagesList[index]),
                        backgroundImage: const AssetImage("assets/bg_dk.png"),
                      )),
            );
          }
        },
      ),
    );
  }
}
