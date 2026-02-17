import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_header/new_quotation_header.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_accounting/new_quotation_accounting.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_discount/new_quotation_discount.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_items/new_quotation_item.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_logistics/new_quotation_logistics.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_taxes/new_quotation_taxes.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_terms/new_quotation_terms.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewQuotation extends StatefulWidget {
  const NewQuotation({super.key});

  @override
  State<NewQuotation> createState() => _NewQuotationState();
}

class _NewQuotationState extends State<NewQuotation> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "new quotation".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TextWidget(
              text: "save".toUpperCase(),
              fontSize: 14,
              textColor: ColorUtils.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
        /// TAB BAR AT BOTTOM
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
            color: ColorUtils.primary,
            padding: EdgeInsets.only(bottom: 3),
            child: TabBar(
              dividerHeight: 0,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              labelStyle: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              tabs:  [
                tabWithBadge('HEADER', 0),
                tabWithBadge('ITEMS', 0),
                tabWithBadge('TAXES',0),
                tabWithBadge('DISCOUNT', 0),
                tabWithBadge('TERMS', 0),
                tabWithBadge('ACCOUNTING',0),
                tabWithBadge('LOGISTICS', 0),
              ],
            ),
          ),
        ),
      ),

      /// TAB BAR VIEW
      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: TabBarView(
          controller: _tabController,
          children: [
            NewQuotationHeader(),
            NewQuotationItem(),
            NewQuotationTaxes(),
            NewQuotationDiscount(),
            NewQuotationTerms(),
            NewQuotationAccounting(),
            NewQuotationLogistics(),
          ],
        ),
      ),
    );
  }

  Widget tabWithBadge(String title, int count) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          if (count > 0) ...[
            const SizedBox(width: 6),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(5),
              // padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}




