/*
 Copyright 2009-2013 Urban Airship Inc. All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 2. Redistributions in binaryform must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided withthe distribution.

 THIS SOFTWARE IS PROVIDED BY THE URBAN AIRSHIP INC``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL URBAN AIRSHIP INC OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#import <Foundation/Foundation.h>

typedef NSString *const UAChannelJSONKey;

extern UAChannelJSONKey UAChannelDeviceTypeKey;
extern UAChannelJSONKey UAChannelTransportKey;
extern UAChannelJSONKey UAChannelOptInKey;
extern UAChannelJSONKey UAChannelPushAddressKey;
extern UAChannelJSONKey UAChannelIdentityHintsKey;
extern UAChannelJSONKey UAChannelUserIDKey;
extern UAChannelJSONKey UAChannelDeviceIDKey;
extern UAChannelJSONKey UAChanneliOSKey;
extern UAChannelJSONKey UAChannelBadgeJSONKey;
extern UAChannelJSONKey UAChannelQuietTimeJSONKey;
extern UAChannelJSONKey UAChannelTimeZoneJSONKey;
extern UAChannelJSONKey UAChannelAliasJSONKey;
extern UAChannelJSONKey UAChannelSetTagsKey;
extern UAChannelJSONKey UAChannelTagsJSONKey;

/**
 * Model object encapsulating the data relevant to a creation or updates processed by UAChannelAPIClient.
 */
@interface UAChannelRegistrationPayload : NSObject<NSCopying>

/**
 * The user ID.
 */
@property(nonatomic, copy)NSString *userID;

/**
 * The device ID.
 */
@property(nonatomic, copy)NSString *deviceID;

/**
 * This flag indicates that the user is able to receive push notifications.
 */
@property(nonatomic, assign)BOOL optedIn;

/**
 * The address to push notifications to.
 */
@property(nonatomic, copy)NSString *pushAddress;

/**
 * The flag indicates tags in this request should be handled.
 */
@property(nonatomic, assign)BOOL setTags;

/**
 * The tags for this device.
 */
@property(nonatomic, strong)NSArray *tags;

/**
 * The alias for this device.
 */
@property(nonatomic, copy)NSString *alias;

/**
 * Quiet time settings for this device.
 */
@property(nonatomic, strong)NSDictionary *quietTime;

/**
 * The time zone for this device.
 */
@property(nonatomic, copy)NSString *timeZone;

/**
 * The badge for this device.
 */
@property(nonatomic, strong)NSNumber *badge;

/**
 * The UAChannelRegistrationPayload as JSON data.
 * @return The payload as JSON data.
 */
- (NSData *)asJSONData;

/**
 * Returns a Boolean value that indicates whether the contents of the receiving
 * payload are equal to the contents of another given payload.
 * @param payload The payload to compare with.
 * @return YES if the contents of the payload are equal to the contents of the
 *         receiving payload, otherwise NO.
 */
- (BOOL)isEqualToPayload:(UAChannelRegistrationPayload *)payload;
@end
