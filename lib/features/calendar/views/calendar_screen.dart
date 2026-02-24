import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/features/calendar/widgets/custom_calendar.dart';
import 'package:flutter_extension/features/calendar/widgets/event_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Calendar',
                    style: GoogleFonts.sora(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Packing milestones & trip dates',
                    style: GoogleFonts.sora(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomCalendar(),
                      SizedBox(height: 30.h),
                      Text(
                        'Upcoming Events',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      const EventCard(
                        type: EventCardType.deadline,
                        title: "Deadline: Oliver's Camp",
                        subtitle: 'Final packing checklist due',
                        dateLabel: 'JAN 12',
                        badgeMonth: 'JUL',
                        badgeDay: '15',
                      ),
                      const EventCard(
                        type: EventCardType.event,
                        title: 'Summer Camp Starts',
                        subtitle: 'Arrive at Winnebago Lodge',
                        dateLabel: 'JAN 15',
                        eventIcon: Icons.inventory_2_outlined,
                      ),
                      const EventCard(
                        type: EventCardType.event,
                        title: 'Summer Camp Starts',
                        subtitle: 'Arrive at Winnebago Lodge',
                        dateLabel: 'JAN 15',
                        eventIcon: Icons.inventory_2_outlined,
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
