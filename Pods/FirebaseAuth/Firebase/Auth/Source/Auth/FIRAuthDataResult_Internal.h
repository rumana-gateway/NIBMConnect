/*
 * Copyright 2017 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "FIRAuthDataResult.h"

@class FIROAuthCredential;

NS_ASSUME_NONNULL_BEGIN

@interface FIRAuthDataResult () <NSSecureCoding>

/** @property credential
    @brief The updated OAuth credential after the the sign-in, link and reauthenticate action.
    @detail This property is for OAuth sign in only.
 */
@property(nonatomic, readonly, nullable) FIROAuthCredential *credential;

/** @fn initWithUser:additionalUserInfo:
    @brief Designated initializer.
    @param user The signed in user reference.
    @param additionalUserInfo The additional user info if available.
 */
- (nullable instancetype)initWithUser:(nullable FIRUser *)user
                   additionalUserInfo:(nullable FIRAdditionalUserInfo *)additionalUserInfo;

/** @fn initWithUser:additionalUserInfo:
    @brief Designated initializer.
    @param user The signed in user reference.
    @param additionalUserInfo The additional user info if available.
    @param credential The updated OAuth credential if available.
 */
- (nullable instancetype)initWithUser:(nullable FIRUser *)user
                   additionalUserInfo:(nullable FIRAdditionalUserInfo *)additionalUserInfo
                           credential:(nullable FIROAuthCredential *)credential
    NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
