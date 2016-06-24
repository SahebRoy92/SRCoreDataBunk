//
//  DemoEntity.h
//  CoreDataExamples
//
//  Created by Saheb Roy on 23/06/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN


@interface DemoEntity : NSManagedObject


+ (BOOL)insertchunkwithBlock;
+ (NSArray *)getAllData;
- (BOOL)deleteEntity;

@end

NS_ASSUME_NONNULL_END

#import "DemoEntity+CoreDataProperties.h"
