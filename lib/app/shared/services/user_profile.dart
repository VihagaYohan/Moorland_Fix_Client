import 'package:flutter/material.dart';

// domain
import 'package:moorland_fix/app/features/auth/domain/entities/_index.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';

class UserProfile {
  UserProfile._internal();
  static final UserProfile _instance = UserProfile._internal();
  factory UserProfile() => _instance;

  UserEntity? _userCache;

  Future<UserEntity?> getUserProfile() async{
    if(_userCache != null) return _userCache;

    _userCache = await DeviceUtils.getUserProfile();
    return _userCache;
  }
}
