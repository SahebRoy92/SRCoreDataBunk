//
//  SRCoreDataManager.h
//  CoreDataExamples
//
//  Created by Saheb Roy on 23/06/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//


/*
 
    This class will add core data functions to a specific queue in a background thread,
    The operations would be in a SERIAL way and would not perform DEADLOCK, and wont BLOCK
    the main thread and the UI
 
    LightWeight Migration is turned on for this manager
 
    This class is to be used as a singleton and call your core data methods from here .
 
    1. Import your core data classes in the .m of this file.
    2. Follow the comments in this class and put the methods accordingly inside the fetch , delete and insert.
    3. For this class to function properly, please have a return (BOOL, Array) from the Core Data methods, so that
        the class would know when to call the completion block.
 
    This class acts as an example as to how to use the NSManagedobject subclass and work with Core data,
    in a more abstract and simple way, without blocking the UI in background thread and as all operations will
    continue in a FIFO order in a single background queue.
 
*/


#import <Foundation/Foundation.h>

@interface SRCoreDataManager : NSObject

+(instancetype)sharedInstance;


-(void)fetchDataWithResults:(void (^)(NSArray *arr))completionBlock;
-(void)insertDataWithCompletion:(void (^)(BOOL didComplete))completionBlock;
-(void)deleteDataWithTask:(void (^)(void))task andCompletionBlock:(void (^)(void))completionBlock;

@end
