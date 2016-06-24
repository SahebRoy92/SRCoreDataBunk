//
//  SRCoreDataManager.m
//  CoreDataExamples
//
//  Created by Saheb Roy on 23/06/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//

#import "SRCoreDataManager.h"
#import "DemoEntity+CoreDataProperties.h"



@implementation SRCoreDataManager



+(instancetype)sharedInstance{
    static SRCoreDataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SRCoreDataManager alloc]init];
    });
    return manager;
}

dispatch_queue_t SRBackgroundQueue() {
    static dispatch_once_t queueCreationGuard;
    static dispatch_queue_t queue;
    dispatch_once(&queueCreationGuard, ^{
        queue = dispatch_queue_create("com.in.CoreData.SRCDSerialManager", 0);
    });
    return queue;
}





-(void)insertDataWithCompletion:(void (^)(BOOL))completionBlock{
    dispatch_async(SRBackgroundQueue(), ^{
        
        //  Write your own Insert Function here from the CD classes, it should also have a bool return
        //  to indicate that the insertion was complete.
        
        BOOL didInsertComplete = [DemoEntity insertchunkwithBlock];
        if(didInsertComplete){
            completionBlock(YES);
        }
    });
    
}


-(void)fetchDataWithResults:(void (^)(NSArray *arr))completionBlock{
    dispatch_async(SRBackgroundQueue(), ^{
        
        // Write your Fetch method here, and do nesassary checking!
        NSArray *alldata = [DemoEntity getAllData];
        if(alldata){
            completionBlock(alldata);
        }
    });
}



-(void)deleteDataWithTask:(void (^)(void))task andCompletionBlock:(void (^)(void))completionBlock{
    dispatch_async(SRBackgroundQueue(), ^{
        task();
        completionBlock();
    });
}



@end
