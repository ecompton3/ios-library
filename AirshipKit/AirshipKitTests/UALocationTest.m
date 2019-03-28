/* Copyright 2018 Urban Airship and Contributors */

#import "UABaseTest.h"
#import "UALocation+Internal.h"
#import "UAPreferenceDataStore+Internal.h"
#import "UAAnalytics.h"
#import "UALocationEvent.h"

@interface UALocationTest : UABaseTest

@property (nonatomic, strong) UAPreferenceDataStore *dataStore;
@property (nonatomic, strong) NSNotificationCenter *notificationCenter;

@property (nonatomic, strong) id mockAnalytics;
@property (nonatomic, strong) id mockLocationManager;
@property (nonatomic, strong) id mockedApplication;
@property (nonatomic, strong) id mockedBundle;
@property (nonatomic, strong) id mockProcessInfo;
@property (nonatomic, assign) NSUInteger testOSMajorVersion;

@end
