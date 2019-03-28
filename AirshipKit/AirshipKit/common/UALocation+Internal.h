/* Copyright Urban Airship and Contributors */

#import "UALocation.h"
#import "UAComponent+Internal.h"
#import "UASystemVersion+Internal.h"

@class UAPreferenceDataStore;
@class UAAnalytics;

/*
 * SDK-private extensions to UALocation
 */
@interface UALocation()

NS_ASSUME_NONNULL_BEGIN

///---------------------------------------------------------------------------------------
/// @name Location Internal Properties
///---------------------------------------------------------------------------------------


/**
 * The data store.
 */
@property (nonatomic, strong) UAPreferenceDataStore *dataStore;

/**
 * The system version.
 */
@property (nonatomic, strong) UASystemVersion *systemVersion;

/**
 * The Urban Airship analytics.
 */
@property (nonatomic, strong) UAAnalytics *analytics;

NS_ASSUME_NONNULL_END

@end
