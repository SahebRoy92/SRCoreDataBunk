//
//  DemoEntity+CoreDataProperties.h
//  CoreDataExamples
//
//  Created by Saheb Roy on 23/06/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DemoEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface DemoEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *number;

@end

NS_ASSUME_NONNULL_END
