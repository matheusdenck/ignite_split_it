import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class TransactionCard extends StatelessWidget {
  final bool isGreen;
  const TransactionCard({Key? key, this.isGreen = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 168,
      padding: EdgeInsets.only(
        top: 16,
        bottom: 16,
        left: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.colors.white,
        border: Border.fromBorderSide(
          BorderSide(
            color: AppTheme.colors.border,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.12,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isGreen
                          ? AppTheme.colors.title
                          : AppTheme.colors.error,
                    ),
                  ),
                ),
                Center(
                  child: isGreen
                      ? Image.asset('assets/images/receber.png')
                      : Image.asset('assets/images/pagar.png'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          isGreen
              ? Text('A receber:', style: AppTheme.textStyles.text14)
              : Text('A pagar:', style: AppTheme.textStyles.text14),
          SizedBox(
            height: 4,
          ),
          Text(
            'R\$150,00',
            style: isGreen
                ? AppTheme.textStyles.money
                : AppTheme.textStyles.moneyRed,
          ),
        ],
      ),
    );
  }
}
