// lib/widgets/hover_card.dart
import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final double elevation;
  final double hoverElevation;

  const HoverCard({
    Key? key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(12),
    this.elevation = 2,
    this.hoverElevation = 8,
  }) : super(key: key);

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final effectiveElevation = _hover
        ? widget.hoverElevation
        : widget.elevation;
    final card = Card(
      elevation: effectiveElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(padding: widget.padding, child: widget.child),
    );

    // MouseRegion works on web/desktop; InkWell gives ripple on mobile
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: card,
      ),
    );
  }
}
