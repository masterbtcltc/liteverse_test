import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:stackwallet/db/isar/main_db.dart';
import 'package:stackwallet/models/isar/models/isar_models.dart';
import 'package:stackwallet/utilities/text_styles.dart';
import 'package:stackwallet/utilities/theme/stack_colors.dart';
import 'package:stackwallet/utilities/util.dart';
import 'package:stackwallet/widgets/background.dart';
import 'package:stackwallet/widgets/conditional_parent.dart';
import 'package:stackwallet/widgets/custom_buttons/app_bar_icon_button.dart';
import 'package:stackwallet/widgets/custom_buttons/simple_copy_button.dart';
import 'package:stackwallet/widgets/rounded_white_container.dart';

class TokenContractDetailsView extends ConsumerStatefulWidget {
  const TokenContractDetailsView({
    Key? key,
    required this.contractAddress,
    required this.walletId,
  }) : super(key: key);

  static const String routeName = "/tokenContractDetailsView";

  final String contractAddress;
  final String walletId;

  @override
  ConsumerState<TokenContractDetailsView> createState() =>
      _TokenContractDetailsViewState();
}

class _TokenContractDetailsViewState
    extends ConsumerState<TokenContractDetailsView> {
  final isDesktop = Util.isDesktop;

  late EthContract contract;

  @override
  void initState() {
    contract = MainDB.instance.isar.ethContracts
        .where()
        .addressEqualTo(widget.contractAddress)
        .findFirstSync()!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalParent(
      condition: !isDesktop,
      builder: (child) => Background(
        child: Scaffold(
          backgroundColor:
              Theme.of(context).extension<StackColors>()!.background,
          appBar: AppBar(
            backgroundColor:
                Theme.of(context).extension<StackColors>()!.backgroundAppBar,
            leading: AppBarBackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            titleSpacing: 0,
            title: Text(
              "Contract details",
              style: STextStyles.navBarTitle(context),
            ),
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (builderContext, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: child,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Item(
            title: "Contract address",
            data: contract.address,
            button: SimpleCopyButton(
              data: contract.address,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          _Item(
            title: "Name",
            data: contract.name,
            button: SimpleCopyButton(
              data: contract.name,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          _Item(
            title: "Symbol",
            data: contract.symbol,
            button: SimpleCopyButton(
              data: contract.symbol,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          _Item(
            title: "Type",
            data: contract.type.name,
            button: SimpleCopyButton(
              data: contract.type.name,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          _Item(
            title: "Decimals",
            data: contract.decimals.toString(),
            button: SimpleCopyButton(
              data: contract.decimals.toString(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.title,
    required this.data,
    required this.button,
  }) : super(key: key);

  final String title;
  final String data;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return RoundedWhiteContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: STextStyles.itemSubtitle(context),
              ),
              button,
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          data.isNotEmpty
              ? SelectableText(
                  data,
                  style: STextStyles.w500_14(context),
                )
              : Text(
                  "$title will appear here",
                  style: STextStyles.w500_14(context).copyWith(
                    color: Theme.of(context)
                        .extension<StackColors>()!
                        .textSubtitle3,
                  ),
                ),
        ],
      ),
    );
  }
}
