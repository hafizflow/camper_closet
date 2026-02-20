import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/features/home/controllers/home_controller.dart';
import 'package:flutter_extension/features/home/widgets/active_list_card.dart';
import 'package:flutter_extension/features/home/widgets/my_closet_card.dart';
import 'package:flutter_extension/features/home/widgets/shop_now_banner.dart';
import 'package:flutter_extension/features/home/widgets/templae_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              _homeHeader(),
              SizedBox(height: 22.h),
              const ActiveListCard(),
              SizedBox(height: 30.h),
              const MyClosetCard(),
              SizedBox(height: 30.h),
              templateCard(),
              SizedBox(height: 40.h),
              const ShopNowBanner(),
              SizedBox(height: 30.h),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Upcoming Events',
                        style: GoogleFonts.sora(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryText,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'View All',
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: AppColors.buttonPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  EventCard(),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ).paddingHorizontal(24.w),
        ),
      ),
    );
  }

  Column templateCard() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Templates',
              style: GoogleFonts.sora(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
            const Spacer(),
            Text(
              'View All',
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppColors.buttonPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        const Row(
          children: [
            Expanded(
              child: TemplateCard(
                title: 'Summer Camp',
                itemCount: 15,
                imageUrl:
                    'https://images.unsplash.com/photo-1523987355523-c7b5b0dd90a7?w=500',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TemplateCard(
                title: 'Tour & Travel',
                itemCount: 15,
                imageUrl:
                    'https://images.unsplash.com/photo-1503220317375-aaad61436b1b?w=500',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _homeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppLogos.homelogo, width: 52, height: 52),
            const SizedBox(width: 12),
            Text(
              'All Packed',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
            const Spacer(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset(
                  AppLogos.homenotification,
                  width: 24,
                  height: 24,
                ),
                Positioned(
                  right: 0,
                  top: -10,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.errorColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 12),

        Column(
          children: [
            Text(
              'Good evening, Heather.',
              style: GoogleFonts.sora(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Everything you need, packed and ready',
              style: GoogleFonts.sora(
                fontSize: 12,
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, // Fixed width for demonstration
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Box
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F4FF),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: const [
                    Text(
                      'JUL',
                      style: TextStyle(
                        color: Color(0xFF7B52E8),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '15',
                      style: TextStyle(
                        color: Color(0xFF7B52E8),
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Summer Camp Start',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E2D3D),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Camp Green Lake, TX',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8E99A3),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Priority Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1F0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Priority',
                  style: TextStyle(
                    color: Color(0xFFD94436),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Gradient Button
          Container(
            width: double.infinity,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color(0xFF5E9EFF), Color(0xFF3B7DED)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3B7DED).withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: Colors.white,
                size: 20,
              ),
              label: const Text(
                'Open Calendar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
