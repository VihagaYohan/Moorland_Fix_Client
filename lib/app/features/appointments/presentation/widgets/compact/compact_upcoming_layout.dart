import 'package:flutter/material.dart';
// providers
import 'package:moorland_fix/app/features/appointments/presentation/provider/appointments_provider.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';
import 'package:moorland_fix/app/shared/services/index.dart';
import 'package:provider/provider.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../appointment_card.dart';

class CompactUpcomingLayout extends StatefulWidget {
  const CompactUpcomingLayout({super.key});

  @override
  State<CompactUpcomingLayout> createState() => _CompactUpcomingLayoutState();
}

class _CompactUpcomingLayoutState extends State<CompactUpcomingLayout> {
  // states
  UserEntity? currentUser;
  String status = "Booked";

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  void showAlert(String title, String message, Function() onPressed) {
    DeviceUtils.showAlertDialog(context, title, message, "OK", onPressed());
  }

  void getUserProfile() async {
    final userProfile = UserProfile();
    UserEntity? userEntity = await userProfile.getUserProfile();
    setState(() {
      currentUser = userEntity;
    });

    if (currentUser != null) {
      Provider.of<AppointmentProvider>(
        context,
        listen: false,
      ).fetchAllAppointments(currentUser!.uid, status);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.spaceMedium,
        vertical: Constants.spaceLarge,
      ),
      child: Consumer<AppointmentProvider>(
        builder: (context, appointmentProvider, _) {
          if (appointmentProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (appointmentProvider.isError) {
            if (appointmentProvider.isError) {
              if (appointmentProvider.getError != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showAlert(
                    "Alert",
                    appointmentProvider.getError!.toString().replaceFirst(
                      "Exception: ",
                      "",
                    ),
                    () {
                      appointmentProvider.resetState();
                    },
                  );
                });
              }
            }
          }

          return ListView.builder(
            itemCount: appointmentProvider.appointments.length,
            itemBuilder: (context, index) {
              return AppointmentCard(
                appointment: appointmentProvider.appointments[index],
                isCompleted: false,
              );
            },
          );
        },
      ),
    );
  }
}
