//
//  CDSerialBackgroundExampleVC.m
//  CoreDataExamples
//
//  Created by Saheb Roy on 23/06/16.
//  Copyright © 2016 OrderOfTheLight. All rights reserved.
//

#import "CDSerialBackgroundExampleVC.h"
#import "SRCoreDataManager.h"

@interface CDSerialBackgroundExampleVC ()

@property (nonatomic,weak) IBOutlet UIScrollView *sclv;
@property (nonatomic,strong) UILabel *lbl_desc;

@end

@implementation CDSerialBackgroundExampleVC

-(void)viewDidLoad{
    self.lbl_desc.text = [self.dict objectForKey:@"desc"];
  //  self.navigationController.navigationBarHidden = YES;
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    float height = getHeightOfLabel(self.lbl_desc.text, 298);
    CGRect frame = CGRectMake(0,0, self.sclv.bounds.size.width, height);
    self.lbl_desc.frame = frame;
    
    self.sclv.contentSize = CGSizeMake(self.sclv.bounds.size.width, height);
}

float getHeightOfLabel(NSString *string,float width){
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, FLT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height;
}

-(UILabel *)lbl_desc{
    if(_lbl_desc == nil){
        _lbl_desc = [[UILabel alloc]init];
        _lbl_desc.numberOfLines = 0;
        _lbl_desc.backgroundColor = [UIColor redColor];
        [self.sclv addSubview:_lbl_desc];
    }
    return _lbl_desc;
}




#pragma mark -- IBActions ---

-(IBAction)actionInsert:(id)sender{
    [[SRCoreDataManager sharedInstance]insertDataWithCompletion:^(BOOL didComplete) {
        NSLog(@"Finished Insertion -- >");
    }];
}


-(IBAction)actionFetch:(id)sender{
    [[SRCoreDataManager sharedInstance]fetchDataWithResults:^(NSArray *arr) {
        NSLog(@"Finished fetch -- >%@",arr);
    }];
}


@end
