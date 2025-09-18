import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/constants/app_constants.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/dash_board/views/widgets/dash_board_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DashBoardServices extends StatelessWidget {
  final List<AnimationController> controllers;
  final List<Animation<double>> fadeAnimations;

  const DashBoardServices({
    super.key,
    required this.controllers,
    required this.fadeAnimations,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: SizeConfig.width * 0.01,
          mainAxisSpacing: SizeConfig.height * 0.01,
        ),
        itemCount: AppConstants.dashBoardItems.length,
        itemBuilder: (context, index) {
          return VisibilityDetector(
            key: Key('dashboard-item-$index'),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction > 0.2) {
                if (!controllers[index].isAnimating &&
                    controllers[index].value == 0.0) {
                  controllers[index].forward();
                }
              } else {
                if (controllers[index].value == 1.0) {
                  controllers[index].reset();
                }
              }
            },
            child: AnimatedBuilder(
              animation: controllers[index],
              builder: (context, child) {
                return FadeTransition(
                  opacity: fadeAnimations[index],
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: index % 2 == 0
                          ? const Offset(1, 0) 
                          : const Offset(-1, 0), 
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: controllers[index],
                        curve: Curves.easeOutQuad,
                      ),
                    ),
                    child:
                        DashBoardCard(item: AppConstants.dashBoardItems[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
