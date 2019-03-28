/* Copyright 2018 Urban Airship and Contributors */

#import "UABaseTest.h"

#import "UAActionArguments+Internal.h"
#import "UAEnableFeatureAction.h"
#import "UAirship+Internal.h"
#import "UAPush+Internal.h"
#import "UALocation.h"
#import "UAAPNSRegistration+Internal.h"

@interface UAEnableFeatureActionTest : UABaseTest

@property (nonatomic, strong) UAEnableFeatureAction *action;
@property (nonatomic, strong) UAActionArguments *arguments;

@property(nonatomic, strong) id mockPush;
@property(nonatomic, strong) id mockLocation;
@property(nonatomic, strong) id mockAirship;
@property(nonatomic, strong) id mockLocationManager;
@property(nonatomic, strong) id mockPushRegistration;
@property(nonatomic, strong) id mockApplication;

@end

