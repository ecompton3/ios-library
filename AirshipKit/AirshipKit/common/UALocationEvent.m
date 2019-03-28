/* Copyright Urban Airship and Contributors */

#import "UALocationEvent.h"
#import "UAEvent+Internal.h"

@implementation UALocationEvent

UALocationEventAnalyticsKey * const UALocationEventForegroundKey = @"foreground";
UALocationEventAnalyticsKey * const UALocationEventLatitudeKey = @"lat";
UALocationEventAnalyticsKey * const UALocationEventLongitudeKey = @"long";
UALocationEventAnalyticsKey * const UALocationEventDesiredAccuracyKey = @"requested_accuracy";
UALocationEventAnalyticsKey * const UALocationEventUpdateTypeKey = @"update_type";
UALocationEventAnalyticsKey * const UALocationEventProviderKey = @"provider";
UALocationEventAnalyticsKey * const UALocationEventDistanceFilterKey = @"update_dist";
UALocationEventAnalyticsKey * const UALocationEventHorizontalAccuracyKey = @"h_accuracy";
UALocationEventAnalyticsKey * const UALocationEventVerticalAccuracyKey = @"v_accuracy";

UALocationEventUpdateType * const UALocationEventAnalyticsType = @"location";
UALocationEventUpdateType * const UALocationEventUpdateTypeChange = @"CHANGE";
UALocationEventUpdateType * const UALocationEventUpdateTypeContinuous = @"CONTINUOUS";
UALocationEventUpdateType * const UALocationEventUpdateTypeSingle = @"SINGLE";
UALocationEventUpdateType * const UALocationEventUpdateTypeNone = @"NONE";

UALocationServiceProviderType *const UALocationServiceProviderGps = @"GPS";
UALocationServiceProviderType *const UALocationServiceProviderNetwork = @"NETWORK";
UALocationServiceProviderType *const UALocationServiceProviderUnknown = @"UNKNOWN";

NSString * const UAAnalyticsValueNone = @"NONE";

- (NSString *)eventType {
    return UALocationEventAnalyticsType;
}

- (UAEventPriority)priority {
    return UAEventPriorityLow;
}


@end
