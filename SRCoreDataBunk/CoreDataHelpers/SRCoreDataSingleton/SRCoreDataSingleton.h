//
//  SRCoreDataSingleton.h
//  CoreDataExamples
//
//  Created by Saheb Roy on 23/06/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//


/*
        THE PURPOSE OF THIS CLASS IS TO TAKE AWAY THE BIOLERPLATE CODE IN APP DELEGATE 
        AND THIS CLASS ACTS AS A WRAPPER AND CONTAINS THE CORE DATA STACK.
        
        THIS CLASS ALSO HAS LIGHTWEIGHT MIGRATION IMPLEMENTED INTO IT.
 
        AND WONT CRASH/ABORT WHEN THE PERSISTANT STORE COORDINATOR FAILS TO LOAD THE STORE
        AS IT WILL CREATE A NEW PSC AND MOVE THE OLDER ONE IN A SAFE LOCATION WITHOUT TAMPERING THE DATA
 
 */

#define CD_EntityName   @"CoreDataExamples"


#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@interface SRCoreDataSingleton : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+(instancetype)sharedInstance;
- (void)saveContext;

@end
