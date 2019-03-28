/* Copyright Urban Airship and Contributors */

#import "UABaseTest.h"
#import "UALocation+Internal.h"
#import "UAPreferenceDataStore+Internal.h"
#import "UAAnalytics.h"
#import "UALocationEvent.h"
#import "UATestSystemVersion.h"


@interface UALocationTest : UABaseTest

@property (nonatomic, strong) UALocation *location;
@property (nonatomic, strong) NSNotificationCenter *notificationCenter;

@property (nonatomic, strong) id mockAnalytics;
@property (nonatomic, strong) id mockLocationManager;
@property (nonatomic, strong) id mockedApplication;
@property (nonatomic, strong) id mockedBundle;
@property (nonatomic, strong) UATestSystemVersion *testSystemVersion;

@end

@implementation UALocationTest

@end

