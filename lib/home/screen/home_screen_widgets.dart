part of '_home_screen.dart';

mixin _HomeScreenWidgets on _HomeScreenProps {
  
  late final horizontalDivider = _CustomHorizontalDivider(
    color: Theme.of(context).primaryColor.withAlpha(150),
  );

  late final certificateCardStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,
    primary: Colors.white,
    onPrimary: Theme.of(context).primaryColor,
    elevation: 2.0,
    shadowColor: Colors.grey.withOpacity(0.7),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  final spacer10 = const SizedBox(height: 10);

  final spacer40 = const SizedBox(height: 40);

  Widget _profileSection(double xPadding, BoxConstraints constraints) {
    
    final titleText = _AdaptiveText(
      homeScreenCubit.state.title,
      constraints: constraints,
      fontSizeOnSmallScreen: 30,
      fontSizeOnBigScreen: 45,
      textAlign: TextAlign.center,
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    );
    
    final graduationCapIcon = Center(
      child: FaIcon(FontAwesomeIcons.graduationCap)
    );
    
    final educationText = _AdaptiveText(
      'Currently majoring in Computer Science at Gunadarma University',
      constraints: constraints,
      fontSizeOnSmallScreen: 20,
      fontSizeOnBigScreen: 25,
      textAlign: TextAlign.center,
    );

    final favFlutterText = _AdaptiveText(
      'Flutter is my favourite framework for building apps!',
      constraints: constraints,
      fontSizeOnSmallScreen: 20,
      fontSizeOnBigScreen: 25,
      textAlign: TextAlign.center,
      selectable: false,
    );

    final socialLinkText = _AdaptiveText(
      'Social Links',
      constraints: constraints,
      fontSizeOnSmallScreen: 20,
      fontSizeOnBigScreen: 25,
      textAlign: TextAlign.center,
      selectable: false,
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    );

    final linkedInButton = ElevatedButton(
      onPressed: homeScreenCubit.openLinkedIn,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.linkedin),
          SizedBox(
            width: 5,
          ),
          Text(
            'LinkedIn',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[50],
        onPrimary: Colors.blue[900],
        elevation: 0,
        shadowColor: Colors.transparent,
        fixedSize: Size.fromHeight(60),
      ),
    );

    final gitHubButton = ElevatedButton(
      onPressed: homeScreenCubit.openGitHub,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.github),
          SizedBox(
            width: 5,
          ),
          Text(
            'GitHub',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue[900],
        onPrimary: Colors.grey[50],
        elevation: 0,
        shadowColor: Colors.transparent,
        fixedSize: const Size.fromHeight(60),
      ),
    );

    final emailButton = TextButton(
      onPressed: homeScreenCubit.openEmail,
      child: Text(
        'iandisantulusn@gmail.com',
      ),
      style: TextButton.styleFrom(
        primary: Colors.blue[900],
      ),
    );

    final certificatesSectionText = _AdaptiveText(
      'Certificates',
      constraints: constraints,
      fontSizeOnSmallScreen: 30,
      fontSizeOnBigScreen: 45,
      textAlign: TextAlign.center,
      textStyle: TextStyle(fontWeight: FontWeight.bold),
      selectable: false,
    );

    return SliverPadding(
      padding: EdgeInsets.fromLTRB(xPadding, 20, xPadding, 10),
      sliver: SliverList(
        delegate: SliverChildListDelegate.fixed(
          [
            titleText,
            spacer10,
            horizontalDivider,
            graduationCapIcon,
            educationText,
            spacer10,
            FlutterLogo(),
            favFlutterText,
            spacer40,
            socialLinkText,
            spacer10,
            linkedInButton,
            spacer10,
            gitHubButton,
            spacer10,
            emailButton,
            spacer10,
            horizontalDivider,
            spacer10,
            certificatesSectionText,
          ],
        ),
      ),
    );
  }
  
  Widget _certificateSection(double xPadding, BoxConstraints constraints) {

    late final int crossAxisCount;
    late final double childAspectRatio;

    if (constraints.maxWidth < AppProps.minMobileScreenWidth) {
      crossAxisCount = 2;
    } else if(constraints.maxWidth < AppProps.minDesktopScreenWidth) {
      crossAxisCount = 3; 
    } else{
      crossAxisCount = 4;
    }

    if(
      constraints.maxWidth < AppProps.minDesktopScreenWidth && 
      constraints.maxWidth >= AppProps.minSmallMobileScreenWidth) {
      
      childAspectRatio = 4 / 5;
      
    } else{
      childAspectRatio = 3 / 4;
    }

    return SliverPadding(
      padding: EdgeInsets.fromLTRB(xPadding, 0, xPadding, 10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            return _CertificateCard(
              certificate: homeScreenCubit.state.certificates[index],
              onPressed: () => homeScreenCubit.openCertificateUrl(index),
              constraints: constraints,
              style: certificateCardStyle,
              textColor: Colors.black,
            );
          },
          childCount: homeScreenCubit.state.certificates.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: childAspectRatio,
        ),
      ),
    );
  }

}

class _AdaptiveText extends StatelessWidget {
  final String text;
  final BoxConstraints constraints;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  /// defaults to 24
  final double? fontSizeOnSmallScreen;

  /// defaults to 30
  final double? fontSizeOnBigScreen;

  /// defaults to 600 (from `AppProps.minScreenWidthToRebuild`)
  final double? maxWidth;

  /// whether text should be selectable or not,
  /// defaults to true
  final bool selectable;

  _AdaptiveText(
    this.text, {
    required this.constraints,
    this.textAlign,
    this.textStyle,
    this.fontSizeOnBigScreen,
    this.fontSizeOnSmallScreen,
    this.maxWidth,
    this.selectable = true,
  });

  double get _fontSize {
    if (constraints.maxWidth < (maxWidth ?? AppProps.minDesktopScreenWidth)) {
      return fontSizeOnSmallScreen ?? 24.0;
    } else {
      return fontSizeOnBigScreen ?? 30.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(constraints.maxWidth.toString());
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        style: textStyle?.copyWith(fontSize: _fontSize) ??
            TextStyle(fontSize: _fontSize),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      style: textStyle?.copyWith(fontSize: _fontSize) ??
          TextStyle(fontSize: _fontSize),
    );
  }
}

class _CustomHorizontalDivider extends StatelessWidget {
  /// defaults to `Colors.grey[300]`
  final Color? color;

  /// defaults to `0.75`
  final double? height;

  /// defaults to `10.0`
  final double? margin;

  const _CustomHorizontalDivider({
    this.color,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 0.75,
      margin: EdgeInsets.all(margin ?? 10.0),
      color: color ?? Colors.grey[300],
    );
  }
}

class _CertificateCard extends StatelessWidget {
  final Certificate certificate;
  final VoidCallback onPressed;
  final BoxConstraints constraints;
  final ButtonStyle? style;
  final Color? textColor;

  const _CertificateCard({
    required this.certificate,
    required this.onPressed,
    required this.constraints,
    this.style,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.35,
            child: certificate.assetImagePath != null
                ? Image.asset(
                    certificate.assetImagePath!,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: FaIcon(
                      FontAwesomeIcons.solidAddressCard,
                      size: 75,
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: _AdaptiveText(
              certificate.title,
              constraints: constraints,
              fontSizeOnBigScreen: 14,
              fontSizeOnSmallScreen: 12,
              selectable: false,
              textStyle: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
