/* Copyright Urban Airship and Contributors */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UAEvent.h"

@protocol UALocationProviderProtocol;

NS_ASSUME_NONNULL_BEGIN

/** Keys and values for location analytics */
typedef NSString UALocationEventAnalyticsKey;
extern UALocationEventAnalyticsKey * const UALocationEventForegroundKey;
extern UALocationEventAnalyticsKey * const UALocationEventLatitudeKey;
extern UALocationEventAnalyticsKey * const UALocationEventLongitudeKey;
extern UALocationEventAnalyticsKey * const UALocationEventDesiredAccuracyKey;
extern UALocationEventAnalyticsKey * const UALocationEventUpdateTypeKey;
extern UALocationEventAnalyticsKey * const UALocationEventProviderKey;
extern UALocationEventAnalyticsKey * const UALocationEventDistanceFilterKey;
extern UALocationEventAnalyticsKey * const UALocationEventHorizontalAccuracyKey;
extern UALocationEventAnalyticsKey * const UALocationEventVerticalAccuracyKey;

typedef NSString UALocationEventUpdateType;
extern UALocationEventUpdateType * const UALocationEventAnalyticsType;
extern UALocationEventUpdateType * const UALocationEventUpdateTypeChange;
extern UALocationEventUpdateType * const UALocationEventUpdateTypeContinuous;
extern UALocationEventUpdateType * const UALocationEventUpdateTypeSingle;
extern UALocationEventUpdateType * const UALocationEventUpdateTypeNone;

typedef NSString UALocationServiceProviderType;
extern UALocationServiceProviderType *const UALocationServiceProviderGps;
extern UALocationServiceProviderType *const UALocationServiceProviderNetwork;
extern UALocationServiceProviderType *const UALocationServiceProviderUnknown;

extern NSString * const UAAnalyticsValueNone;

/** 
 * A UALocationEvent captures all the necessary information for
 * UAAnalytics.
 */
@interface UALocationEvent : UAEvent

///---------------------------------------------------------------------------------------
/// @name Location Event Factories
///---------------------------------------------------------------------------------------




NS_ASSUME_NONNULL_END

@end
