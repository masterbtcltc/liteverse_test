import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isar/isar.dart';
import 'package:stackwallet/models/isar/exchange_cache/currency.dart';
import 'package:stackwallet/services/exchange/exchange_data_loading_service.dart';
import 'package:stackwallet/utilities/assets.dart';
import 'package:stackwallet/utilities/enums/coin_enum.dart';

class EthTokenIcon extends StatefulWidget {
  const EthTokenIcon({
    Key? key,
    required this.contractAddress,
    this.size = 22,
  }) : super(key: key);

  final String contractAddress;
  final double size;

  @override
  State<EthTokenIcon> createState() => _EthTokenIconState();
}

class _EthTokenIconState extends State<EthTokenIcon> {
  late final String? imageUrl;

  @override
  void initState() {
    imageUrl = ExchangeDataLoadingService.instance.isar.currencies
        .where()
        .filter()
        .tokenContractEqualTo(widget.contractAddress, caseSensitive: false)
        .findFirstSync()
        ?.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return SvgPicture.asset(
        Assets.svg.iconFor(coin: Coin.ethereum),
        width: widget.size,
        height: widget.size,
      );
    } else {
      return SvgPicture.network(
        imageUrl!,
        width: widget.size,
        height: widget.size,
      );
    }
  }
}
