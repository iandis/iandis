part of '_home_screen.dart';

class _AdaptiveText extends StatelessWidget {
  final String text;
  final BoxConstraints constraints;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  /// defaults to 24
  final double? fontSizeOnSmallScreen;
  /// defaults to 30
  final double? fontSizeOnBigScreen;
  /// defaults to 540
  final double? maxWidth;
  
  _AdaptiveText(
    this.text, 
    {
      required this.constraints, 
      this.textAlign,
      this.textStyle,
      this.fontSizeOnBigScreen,
      this.fontSizeOnSmallScreen,
      this.maxWidth,
    });

  double get _fontSize {
    if(constraints.maxWidth < (maxWidth ?? 540)) {
      return fontSizeOnSmallScreen ?? 24.0;
    }else{
      return fontSizeOnBigScreen ?? 30.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(constraints.maxWidth.toString());
    return SelectableText(
      text, 
      textAlign: textAlign,
      style: textStyle?.copyWith(fontSize: _fontSize) ?? TextStyle(fontSize: _fontSize),
    );
  }

}

