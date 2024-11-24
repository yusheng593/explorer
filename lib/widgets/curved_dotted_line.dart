import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CurvedLineWithDotsPainter extends CustomPainter {
  final int numDots; // 曲線上的點數量
  final int currentIndex; // 當前高亮點的索引
  final double padding = 20.0; // 左右留白

  CurvedLineWithDotsPainter(
      {required this.numDots, required this.currentIndex});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2) // 設置虛線顏色
      ..strokeWidth = 3 // 虛線的寬度
      ..style = PaintingStyle.stroke; // 使用描邊樣式

    // 從左到右的拋物線，並讓曲線在畫布的高度內有一定的彎曲
    final path = Path() // 需要繪製的路徑
      ..moveTo(0, size.height * 1.2) // 從畫布左下角開始
      // 控制點 (x1, y1)：曲線的彎曲程度由它決定
      // 終點 (x2, y2)：曲線的終點
      ..quadraticBezierTo(size.width / 2, 0, size.width, size.height * 1.2);
    // 將完整的曲線轉換為虛線
    final dashPath = _createDashedPath(path);
    canvas.drawPath(dashPath, paint);

    // Draw the dots along the curve
    for (int i = 0; i < numDots; i++) {
      double t = i / (numDots - 1); // 計算點在曲線上的位置（比例）
      Offset position = _getPositionAlongCurve(t, size);

      // Create a paint object for the shadow
      final shadowPaint = Paint()
        ..color = Colors.white.withOpacity(0.2)
        ..style = PaintingStyle.fill;

      // Create a paint object for the dot
      final dotPaint = Paint()
        ..color = (i == currentIndex) ? Colors.white : Colors.grey[300]!
        ..style = PaintingStyle.fill;

      double dotSize = (i == currentIndex) ? 8 : 5; // 高亮點更大
      double shadowSize = (i == currentIndex) ? 6 : 0;

      // 陰影
      canvas.drawCircle(position, dotSize + shadowSize, shadowPaint);

      // 點
      canvas.drawCircle(position, dotSize, dotPaint);
    }
  }

  Path _createDashedPath(Path source) {
    const double dashWidth = 5.0; // 虛線的每段長度
    const double dashSpace = 5.0; // 每段虛線之間的間距
    final Path dashedPath = Path();
    double distance = 0.0; // 紀錄當前總長度

    for (PathMetric measurePath in source.computeMetrics()) {
      while (distance < measurePath.length) {
        const double length = dashWidth + dashSpace;
        final Path extractPath =
            measurePath.extractPath(distance, distance + dashWidth);
        dashedPath.addPath(extractPath, Offset.zero);
        distance += length;
      }
    }
    return dashedPath;
  }

  Offset _getPositionAlongCurve(double t, Size size) {
    double x = size.width * t; // 根據比例計算 x 坐標
    double y = size.height * 0.6 +
        (pow((1 - 2 * t), 2) * size.height * 0.48); // 曲線的 y 坐標公式

    // 確保 x 在範圍內
    x = x.clamp(padding, size.width - padding);
    return Offset(x, y);
  }

  // 發生變化時重新繪製（高亮點變了需要更新）
  @override
  bool shouldRepaint(covariant CurvedLineWithDotsPainter oldDelegate) {
    return oldDelegate.currentIndex != currentIndex;
  }
}
