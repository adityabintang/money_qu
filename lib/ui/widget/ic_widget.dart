import '../../utils/my_import.dart';

class IcIconWidget extends StatelessWidget {
  final String image;
  final double size;
  final Color? color;

  const IcIconWidget(
      {Key? key, required this.image, this.size = 24.0, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(image),
      size: size,
      color: color ?? IconTheme.of(context).color,
    );
  }
}
