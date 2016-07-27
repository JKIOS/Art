//
//  JKHomePageViewModel.h
//  TRProject
//
//  Created by Tarena on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "JKHomePageModel.h"
@interface JKHomePageViewModel : TRBaseViewModel
@property (nonatomic) NSArray<Gallerylist *> *gallery;
@property (nonatomic) NSMutableArray<Imagetextlist *> *imagetextlist;
@property (nonatomic) NSArray<Labellist *> *labelList;
@property (nonatomic) NSInteger fristRowNum;
- (Gallerylist *)gallerymodelForRow:(NSInteger)row;
- (NSString *)galleryname:(NSInteger)row;
- (NSString *)gallerynumlable:(NSInteger)row;
- (NSURL *)galleryimageVM:(NSInteger)row;
@property (nonatomic) NSInteger rowNum;
- (Imagetextlist *)modelForRow:(NSInteger)row;
- (NSString *)name:(NSInteger)row;
- (NSString *)numlable:(NSInteger)row;
- (NSURL *)imageVM:(NSInteger)row;
@property (nonatomic) NSInteger num;
@property (nonatomic, getter=ishasMore) BOOL hasMore;
@property(nonatomic)NSInteger unloadCout;
@end
