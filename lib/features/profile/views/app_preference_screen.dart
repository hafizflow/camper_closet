import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPreferencesScreen extends StatefulWidget {
  const AppPreferencesScreen({super.key});

  @override
  State<AppPreferencesScreen> createState() => _AppPreferencesScreenState();
}

class _AppPreferencesScreenState extends State<AppPreferencesScreen> {
  bool _darkMode = false;
  bool _biometrics = true;
  bool _emailDigest = true;
  bool _pushNotifications = false;
  String _selectedLanguage = 'English';
  String _selectedTheme = 'System';

  final List<String> _languages = ['English', 'Spanish', 'French', 'German', 'Arabic'];
  final List<String> _themes = ['System', 'Light', 'Dark'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16.sp,
                        color: const Color(0xFF1A1A2E),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'App Preferences',
                    style: GoogleFonts.sora(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1A1A2E),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 28.h),

              // APPEARANCE
              _SectionLabel(label: 'APPEARANCE'),
              SizedBox(height: 10.h),
              _PrefsCard(
                children: [
                  _ToggleTile(
                    icon: Icons.dark_mode_outlined,
                    iconColor: const Color(0xFF1A1A2E),
                    label: 'Dark Mode',
                    value: _darkMode,
                    isFirst: true,
                    onChanged: (v) => setState(() => _darkMode = v),
                  ),
                  _DividerLine(),
                  _PickerTile(
                    icon: Icons.palette_outlined,
                    iconColor: const Color(0xFF7C3AED),
                    label: 'Theme',
                    value: _selectedTheme,
                    options: _themes,
                    onChanged: (v) => setState(() => _selectedTheme = v),
                  ),
                  _DividerLine(),
                  _PickerTile(
                    icon: Icons.language_rounded,
                    iconColor: const Color(0xFF2B7FFF),
                    label: 'Language',
                    value: _selectedLanguage,
                    options: _languages,
                    onChanged: (v) => setState(() => _selectedLanguage = v),
                    isLast: true,
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // SECURITY
              _SectionLabel(label: 'SECURITY'),
              SizedBox(height: 10.h),
              _PrefsCard(
                children: [
                  _ToggleTile(
                    icon: Icons.fingerprint_rounded,
                    iconColor: const Color(0xFF10B981),
                    label: 'Biometric Login',
                    value: _biometrics,
                    isFirst: true,
                    onChanged: (v) => setState(() => _biometrics = v),
                  ),
                  _DividerLine(),
                  _ActionTile(
                    icon: Icons.lock_reset_rounded,
                    iconColor: const Color(0xFFF5A623),
                    label: 'Change Password',
                    isLast: true,
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // NOTIFICATIONS
              _SectionLabel(label: 'NOTIFICATIONS'),
              SizedBox(height: 10.h),
              _PrefsCard(
                children: [
                  _ToggleTile(
                    icon: Icons.mark_email_read_outlined,
                    iconColor: const Color(0xFF2B7FFF),
                    label: 'Email Digest',
                    value: _emailDigest,
                    isFirst: true,
                    onChanged: (v) => setState(() => _emailDigest = v),
                  ),
                  _DividerLine(),
                  _ToggleTile(
                    icon: Icons.notifications_active_outlined,
                    iconColor: const Color(0xFFF5A623),
                    label: 'Push Notifications',
                    value: _pushNotifications,
                    isLast: true,
                    onChanged: (v) => setState(() => _pushNotifications = v),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // DANGER ZONE
              _SectionLabel(label: 'DANGER ZONE'),
              SizedBox(height: 10.h),
              _PrefsCard(
                children: [
                  _ActionTile(
                    icon: Icons.delete_sweep_outlined,
                    iconColor: const Color(0xFFE53935),
                    label: 'Clear App Cache',
                    isFirst: true,
                    onTap: () {},
                  ),
                  _DividerLine(),
                  _ActionTile(
                    icon: Icons.no_accounts_outlined,
                    iconColor: const Color(0xFFE53935),
                    label: 'Delete Account',
                    isLast: true,
                    isDestructive: true,
                    onTap: () => _showDeleteConfirmation(context),
                  ),
                ],
              ),

              SizedBox(height: 32.h),

              // Version info
              Center(
                child: Text(
                  'Version 2.4.0 · Build 1042',
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: const Color(0xFFCBD5E1),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Text(
          'Delete Account?',
          style: GoogleFonts.sora(fontWeight: FontWeight.w700, fontSize: 18.sp),
        ),
        content: Text(
          'This action is permanent and cannot be undone. All your data will be erased.',
          style: GoogleFonts.inter(fontSize: 14.sp, color: const Color(0xFF90A1B9)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.inter(color: const Color(0xFF90A1B9))),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Delete',
              style: GoogleFonts.inter(
                color: const Color(0xFFE53935),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Shared Widgets ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        color: const Color(0xFF90A1B9),
      ),
    );
  }
}

class _PrefsCard extends StatelessWidget {
  final List<Widget> children;
  const _PrefsCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _DividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 68.w,
      endIndent: 0,
      color: const Color(0xFFF1F5F9),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final bool value;
  final bool isFirst;
  final bool isLast;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    this.isFirst = false,
    this.isLast = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: iconColor, size: 20.sp),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A1A2E),
              ),
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF2B7FFF),
          ),
        ],
      ),
    );
  }
}

class _PickerTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final List<String> options;
  final bool isFirst;
  final bool isLast;
  final ValueChanged<String> onChanged;

  const _PickerTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.options,
    this.isFirst = false,
    this.isLast = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.vertical(
          top: isFirst ? Radius.circular(18.r) : Radius.zero,
          bottom: isLast ? Radius.circular(18.r) : Radius.zero,
        ),
        onTap: () async {
          final selected = await showModalBottomSheet<String>(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            ),
            builder: (_) => _OptionsSheet(options: options, selected: value, label: label),
          );
          if (selected != null) onChanged(selected);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          child: Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: iconColor, size: 20.sp),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1A2E),
                  ),
                ),
              ),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF90A1B9),
                ),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.chevron_right_rounded, size: 20.sp, color: const Color(0xFFCBD5E1)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final bool isFirst;
  final bool isLast;
  final bool isDestructive;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.isFirst = false,
    this.isLast = false,
    this.isDestructive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.vertical(
          top: isFirst ? Radius.circular(18.r) : Radius.zero,
          bottom: isLast ? Radius.circular(18.r) : Radius.zero,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          child: Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: iconColor, size: 20.sp),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: isDestructive ? const Color(0xFFE53935) : const Color(0xFF1A1A2E),
                  ),
                ),
              ),
              Icon(Icons.chevron_right_rounded, size: 20.sp, color: const Color(0xFFCBD5E1)),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionsSheet extends StatelessWidget {
  final List<String> options;
  final String selected;
  final String label;

  const _OptionsSheet({
    required this.options,
    required this.selected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.sora(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A1A2E),
            ),
          ),
          SizedBox(height: 16.h),
          ...options.map(
            (option) => ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                option,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: option == selected ? FontWeight.w700 : FontWeight.w400,
                  color: option == selected ? const Color(0xFF2B7FFF) : const Color(0xFF1A1A2E),
                ),
              ),
              trailing: option == selected
                  ? Icon(Icons.check_rounded, color: const Color(0xFF2B7FFF), size: 20.sp)
                  : null,
              onTap: () => Navigator.pop(context, option),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}