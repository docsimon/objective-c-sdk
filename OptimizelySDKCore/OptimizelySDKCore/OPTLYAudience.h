/****************************************************************************
 * Copyright 2016, Optimizely, Inc. and contributors                        *
 *                                                                          *
 * Licensed under the Apache License, Version 2.0 (the "License");          *
 * you may not use this file except in compliance with the License.         *
 * You may obtain a copy of the License at                                  *
 *                                                                          *
 *    http://www.apache.org/licenses/LICENSE-2.0                            *
 *                                                                          *
 * Unless required by applicable law or agreed to in writing, software      *
 * distributed under the License is distributed on an "AS IS" BASIS,        *
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. *
 * See the License for the specific language governing permissions and      *
 * limitations under the License.                                           *
 ***************************************************************************/

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModelLib.h>
#import "OPTLYCondition.h"

@protocol OPTLYAudience;

@interface OPTLYAudience : JSONModel <OPTLYCondition>

/// The audience id
@property (nonatomic, strong) NSString *audienceId;
/// The audience name
@property (nonatomic, strong) NSString *audienceName;
/// Audience evaluator conditionals
@property (nonatomic, strong) NSArray<OPTLYCondition> *conditions;

/// Override JSONModel set conditions
- (void)setConditionsWithNSString:(NSString *)string;

@end
