import 'package:flutter/material.dart';
import 'package:defifundr_mobile/core/design_system/theme_extension/app_theme_extension.dart';
import 'package:defifundr_mobile/core/design_system/font_extension/font_extension.dart';
import 'package:defifundr_mobile/core/design_system/color_extension/app_color_extension.dart';
import 'package:defifundr_mobile/feature/payment_screens/models/payment.dart';
import 'package:defifundr_mobile/feature/payment_screens/widgets/payment_item_card.dart';
import 'package:go_router/go_router.dart';
import 'package:defifundr_mobile/core/routers/routes_constant.dart';

// Define a simple data model for an Asset
class Asset {
  final String iconPath;
  final String name;
  final String price;
  final String change;
  final String balance;
  final String balanceCurrency;

  Asset({
    required this.iconPath,
    required this.name,
    required this.price,
    required this.change,
    required this.balance,
    required this.balanceCurrency,
  });
}

// Widget for a single Asset List Item
class AssetListItem extends StatelessWidget {
  final Asset asset;
  final VoidCallback? onTap;

  const AssetListItem({Key? key, required this.asset, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorExtension>()!;
    final fontTheme = Theme.of(context).extension<AppFontThemeExtension>()!;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            // Icon
            Image.asset(
              asset.iconPath, // Assuming asset icons are images
              width: 36, // Adjust size as needed
              height: 36, // Adjust size as needed
            ),
            const SizedBox(width: 12), // Spacing between icon and text
            // Asset Details (Name, Price, Change)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.name,
                    style: fontTheme.textBaseMedium, // Asset name style
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        asset.price,
                        style: fontTheme.textSmRegular, // Price style
                      ),
                      const SizedBox(width: 4),
                      Text(
                        asset.change,
                        style: fontTheme.textSmRegular?.copyWith(
                            color: colors
                                .redDefault), // Change style (red for negative)
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Balance Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  asset.balance,
                  style: fontTheme.textBaseMedium, // Balance amount style
                ),
                const SizedBox(height: 4),
                Text(
                  asset.balanceCurrency,
                  style: fontTheme.textSmRegular?.copyWith(
                      color: colors.textSecondary), // Balance currency style
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FinanceHomeScreen extends StatelessWidget {
  const FinanceHomeScreen({Key? key}) : super(key: key);

  // Dummy data for Assets
  static final List<Asset> dummyAssets = [
    Asset(
      iconPath: 'assets/images/usdt.png', // Placeholder icon path
      name: 'Tether USD',
      price: '\$1.00',
      change: '-0.0018%',
      balance: '\$476.19',
      balanceCurrency: '581 USDT',
    ),
    Asset(
      iconPath: 'assets/images/usdc.png', // Placeholder icon path
      name: 'USD Coin',
      price: '\$0.99',
      change: '-0.005%',
      balance: '\$476.10',
      balanceCurrency: '581 USDC',
    ),
    // Add more dummy assets as needed
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorExtension>()!;
    final fontTheme = Theme.of(context).extension<AppFontThemeExtension>()!;
    final textTheme = context.theme.textTheme;
    // Dummy data for Transactions (using the existing Payment model)
    final List<Payment> dummyTransactions = [
      Payment(
        title: 'LoopLabs Transfer fo...',
        paymentType: PaymentType.contract,
        estimatedDate: DateTime(2025, 5, 21), // Placeholder date
        amount: 581,
        paymentNetwork: PaymentNetwork.ethereum, // Placeholder network
        currency: 'USDT',
        status: PaymentStatus.upcoming, // Placeholder status
        icon: 'assets/images/invoice.png', // Using the image path
        iconBackgroundColor: colors.orangeDefault, // Using theme color
      ),
      Payment(
        title: 'MintForge Bug fixes a...',
        paymentType: PaymentType.invoice,
        estimatedDate: DateTime(2025, 5, 21), // Placeholder date
        amount: 581,
        paymentNetwork: PaymentNetwork.starknet, // Placeholder network
        currency: 'USDT',
        status: PaymentStatus.upcoming, // Placeholder status
        icon: 'assets/images/money.png', // Using the image path
        iconBackgroundColor: colors.brandDefault, // Using theme color
      ),
      Payment(
        title: 'ShopLink Pro UX Audi...',
        paymentType: PaymentType.contract,
        estimatedDate: DateTime(2025, 5, 21), // Placeholder date
        amount: 581,
        paymentNetwork: PaymentNetwork.solana, // Placeholder network
        currency: 'USDT',
        status: PaymentStatus.upcoming, // Placeholder status
        icon: 'assets/images/invoice.png', // Using the image path
        iconBackgroundColor: colors.orangeDefault, // Using theme color
      ),
      Payment(
        title: 'Brightfolk Payment fo...',
        paymentType: PaymentType.invoice,
        estimatedDate: DateTime(2025, 5, 21), // Placeholder date
        amount: 581,
        paymentNetwork: PaymentNetwork.ethereum, // Placeholder network
        currency: 'USDT',
        status: PaymentStatus.overdue, // Placeholder status
        icon: 'assets/images/money.png', // Using the image path
        iconBackgroundColor: colors.brandDefault, // Using theme color
      ),
      Payment(
        title: 'Neurolytix Initial cons...',
        paymentType: PaymentType.contract,
        estimatedDate: DateTime(2025, 5, 21), // Placeholder date
        amount: 581,
        paymentNetwork: PaymentNetwork.starknet, // Placeholder network
        currency: 'USDT',
        status: PaymentStatus.upcoming, // Placeholder status
        icon: 'assets/images/invoice.png', // Using the image path
        iconBackgroundColor: colors.orangeDefault, // Using theme color
      ),
      Payment(
        title: 'Quikdash Reimburse...',
        paymentType: PaymentType.invoice,
        estimatedDate: DateTime(2025, 5, 21), // Placeholder date
        amount: 581,
        paymentNetwork: PaymentNetwork.solana, // Placeholder network
        currency: 'USDT',
        status: PaymentStatus.upcoming, // Placeholder status
        icon: 'assets/images/money.png', // Using the image path
        iconBackgroundColor: colors.brandDefault, // Using theme color
      ),
      // Add more dummy transactions as needed
    ];

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: AppBar(
        title: Text(
          'Finance',
          style: fontTheme.heading2Bold,
        ),
        backgroundColor: colors.bgB1,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total Balance Section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                decoration: BoxDecoration(
                  color: colors.bgB0,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total balance',
                      style: textTheme.bodySmall?.copyWith(
                          color: colors.textSecondary,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$5,050.00',
                      style: textTheme.displayLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '-0.0051% (\$0.90)',
                      style: textTheme.bodySmall?.copyWith(
                          color: colors.redDefault,
                          fontWeight: FontWeight.w500),
                    ),

                    const SizedBox(height: 24),

                    // Receive and Withdraw Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context.pushNamed(RouteConstants.selectAsset);
                            },
                            icon: Icon(
                              Icons.arrow_downward,
                              color: colors.blueDefault,
                            ),
                            label: Text(
                              'Receive',
                              style: TextStyle(color: colors.blueDefault),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.brandFill,
                              foregroundColor: colors.textPrimary,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context.pushNamed(RouteConstants.withdraw);
                            },
                            icon: Icon(
                              Icons.arrow_upward,
                              color: colors.blueDefault,
                            ),
                            label: Text(
                              'Withdraw',
                              style: TextStyle(color: colors.blueDefault),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.brandFill,
                              foregroundColor: colors.textPrimary,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Promotional Card
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: colors.brandDefault,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'A virtual card built for your crypto life',
                            style: fontTheme.textBaseBold
                                ?.copyWith(color: colors.textWhite),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'launching soon on DefiFundr.',
                            style: fontTheme.textSmRegular?.copyWith(
                                color: colors.textWhite.withOpacity(0.8)),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement Coming soon action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.greenDefault,
                              foregroundColor: colors.textWhite,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Coming soon',
                              style: TextStyle(color: colors.bgB0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Placeholder for the card image/illustration
                    SizedBox(
                      width: 80,
                      height: 80,
                      // TODO: Add card image/illustration here
                      // child: Image.asset('assets/images/card_illustration.png'), // Example
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Align(
                alignment: Alignment.centerLeft,
                child: Text('Assets',
                    style: textTheme
                        .displayMedium // Assuming a heading style for sections
                    ),
              ),
              const SizedBox(height: 16),
              // Assets Section
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                decoration: BoxDecoration(
                    color: colors.contrastWhite,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    // Replaced with ListView.builder
                    ListView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Disable scrolling for this list
                      itemCount: dummyAssets.length,
                      itemBuilder: (context, index) {
                        final asset = dummyAssets[index];
                        return AssetListItem(
                          asset: asset,
                          onTap: () {
                            context.pushNamed(RouteConstants.assetDetails);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Transactions Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions',
                    style: textTheme.displayMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement See all transactions action
                    },
                    child: Text('See all >',
                        style: fontTheme.textBaseMedium
                            ?.copyWith(color: colors.brandDefault)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Integrated Transactions List
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: colors.bgB0),
                // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling for this list
                  itemCount:
                      dummyTransactions.length, // Use dummy transactions data
                  itemBuilder: (context, index) {
                    final payment =
                        dummyTransactions[index]; // Use dummy transaction data
                    return PaymentItemCard(payment: payment);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
