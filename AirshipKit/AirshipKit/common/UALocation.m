/* Copyright Urban Airship and Contributors */

#import <UIKit/UIKit.h>

#import "UALocation+Internal.h"
#import "UAPreferenceDataStore+Internal.h"
#import "UAGlobal.h"
#import "UALocationEvent.h"
#import "UAAnalytics.h"
#import "UASystemVersion+Internal.h"


NSString *const UALocationAutoRequestAuthorizationEnabled = @"UALocationAutoRequestAuthorizationEnabled";
NSString *const UALocationUpdatesEnabled = @"UALocationUpdatesEnabled";
NSString *const UALocationBackgroundUpdatesAllowed = @"UALocationBackgroundUpdatesAllowed";

@implementation UALocation

- (instancetype)initWithAnalytics:(UAAnalytics *)analytics dataStore:(UAPreferenceDataStore *)dataStore notificationCenter:(NSNotificationCenter *)notificationCenter systemVersion:(UASystemVersion *)systemVersion {
    self = [super initWithDataStore:dataStore];

    if (self) {
        self.dataStore = dataStore;
        self.analytics = analytics;
        self.systemVersion = systemVersion;

        // Update the location service on app background
        [notificationCenter addObserver:self
                               selector:@selector(updateLocationService)
                                   name:UIApplicationDidEnterBackgroundNotification
                                 object:nil];

        // Update the location service on app becoming active
        [notificationCenter addObserver:self
                               selector:@selector(updateLocationService)
                                   name:UIApplicationDidBecomeActiveNotification
                                 object:nil];

        if (self.componentEnabled) {
            [self updateLocationService];
        }
    }

    return self;
}


+ (instancetype)locationWithAnalytics:(UAAnalytics *)analytics
                            dataStore:(UAPreferenceDataStore *)dataStore {
    return [[UALocation alloc] initWithAnalytics:analytics
                                       dataStore:dataStore
                              notificationCenter:[NSNotificationCenter defaultCenter]
                                   systemVersion:[UASystemVersion systemVersion]];
}

+ (instancetype)locationWithAnalytics:(UAAnalytics *)analytics
                            dataStore:(UAPreferenceDataStore *)dataStore
                   notificationCenter:(NSNotificationCenter *)notificationCenter
                        systemVersion:(UASystemVersion *)systemVersion {
    return [[UALocation alloc] initWithAnalytics:analytics
                                       dataStore:dataStore
                              notificationCenter:notificationCenter
                                   systemVersion:systemVersion];
}

- (BOOL)isAutoRequestAuthorizationEnabled {
    if (![self.dataStore objectForKey:UALocationAutoRequestAuthorizationEnabled]) {
        return YES;
    }

    return [self.dataStore boolForKey:UALocationAutoRequestAuthorizationEnabled];
}

- (void)setAutoRequestAuthorizationEnabled:(BOOL)autoRequestAuthorizationEnabled {
    [self.dataStore setBool:autoRequestAuthorizationEnabled forKey:UALocationAutoRequestAuthorizationEnabled];
}

- (BOOL)isLocationUpdatesEnabled {
    return [self.dataStore boolForKey:UALocationUpdatesEnabled];
}

- (void)setLocationUpdatesEnabled:(BOOL)locationUpdatesEnabled {
    if (locationUpdatesEnabled == self.isLocationUpdatesEnabled) {
        return;
    }

    [self.dataStore setBool:locationUpdatesEnabled forKey:UALocationUpdatesEnabled];
    [self updateLocationService];
}

- (BOOL)isBackgroundLocationUpdatesAllowed {
    return [self.dataStore boolForKey:UALocationBackgroundUpdatesAllowed];
}

- (void)setBackgroundLocationUpdatesAllowed:(BOOL)backgroundLocationUpdatesAllowed {
    if (backgroundLocationUpdatesAllowed == self.isBackgroundLocationUpdatesAllowed) {
        return;
    }

    [self.dataStore setBool:backgroundLocationUpdatesAllowed forKey:UALocationBackgroundUpdatesAllowed];

    if ([UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
        [self updateLocationService];
    }
}

- (void)updateLocationService {
    if (!self.componentEnabled) {
        return;
    }
    
    // Check if location updates are enabled
    if (!self.locationUpdatesEnabled) {
        [self stopLocationUpdates];
        return;
    }


    // Check if location updates are allowed in the background if we are in the background
    if ([[UIApplication sharedApplication] applicationState] != UIApplicationStateActive && !self.isBackgroundLocationUpdatesAllowed) {
        [self stopLocationUpdates];
        return;
    }

    // Check authorization
    
    [self stopLocationUpdates];
}

- (void)stopLocationUpdates {
    if (!self.locationUpdatesStarted) {
        // Already stopped
        return;
    }

    UA_LINFO("Stopping location updates.");

    self.locationUpdatesStarted = NO;

    id strongDelegate = self.delegate;
    if ([strongDelegate respondsToSelector:@selector(locationUpdatesStopped)]) {
        [strongDelegate locationUpdatesStopped];
    }
}

- (void)startLocationUpdates {
    if (!self.componentEnabled) {
        return;
    }
    
    if (self.locationUpdatesStarted) {
        // Already started
        return;
    }

    UA_LINFO("Starting location updates.");
    self.locationUpdatesStarted = YES;

    id strongDelegate = self.delegate;
    if ([strongDelegate respondsToSelector:@selector(locationUpdatesStarted)]) {
        [strongDelegate locationUpdatesStarted];
    }
}

- (void)requestAuthorization {
    // Already requested
        return;
}

- (BOOL)usageDescriptionsAreValid {
    return true;
}

- (BOOL)isLocationOptedIn {
        return NO;
}

- (BOOL)isLocationDeniedOrRestricted {
    return YES;
}

- (NSString *)locationPermissionDescription {
    
    return @"NOT_ALLOWED";
}

- (void)onComponentEnableChange {
    if (self.componentEnabled) {
        // if component was disabled and is now enabled, start updating the location
        [self updateLocationService];
    } else {
        // if component was enabled and is now disabled, stop updating the location
        [self stopLocationUpdates];
    }
}

@end


