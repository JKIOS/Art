//
//  JKHomePageViewModel.m
//  TRProject
//
//  Created by Tarena on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKHomePageViewModel.h"
#import "JKNetWorking.h"
@implementation JKHomePageViewModel
- (NSMutableArray<Imagetextlist *> *)imagetextlist{
    if (!_imagetextlist) {
        _imagetextlist = [NSMutableArray new];
    }
    return _imagetextlist;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpnum = 1;
    switch (requestMode) {
        case VMRequestModeRefresh: {
            tmpnum = 1;
            break;
        }
        case VMRequestModeMore: {
            tmpnum = _num + 1;
            break;
        }
    }
    _dataTask = [JKNetWorking getHomePageWithPage:tmpnum CompletionHandler:^(JKHomePageModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }else{
            if (model.data.imageTextList.count == 10) {
                _hasMore = YES;
            }else{
                _hasMore = NO;
            }
            if (requestMode == VMRequestModeRefresh) {
                _gallery = model.data.galleryList;
                _labelList = model.data.labelList;
                [self.imagetextlist removeAllObjects];
            }
            self.unloadCout = self.imagetextlist.count;
            [self.imagetextlist addObjectsFromArray:model.data.imageTextList];
            _num = tmpnum;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSInteger)fristRowNum{
    return self.gallery.count;
}
- (Gallerylist *)gallerymodelForRow:(NSInteger)row{
    return self.gallery[row];
}
- (NSString *)galleryname:(NSInteger)row{
    return [self gallerymodelForRow:row].galleryName;
}
- (NSURL *)galleryimageVM:(NSInteger)row{
    return [self gallerymodelForRow:row].galleryPic.yx_URL;
}
- (NSString *)gallerynumlable:(NSInteger)row{
    return @([self gallerymodelForRow:row].viewerNumBase).stringValue;
}
- (NSInteger)rowNum{
    return self.imagetextlist.count;
}
- (Imagetextlist *)modelForRow:(NSInteger)row{
    return self.imagetextlist[row];
}
- (NSString *)name:(NSInteger)row{
    return [self modelForRow:row].topicName;
}
- (NSURL *)imageVM:(NSInteger)row{
    return [self modelForRow:row].topicPic.yx_URL;
}
- (NSString *)numlable:(NSInteger)row{
    return @([self modelForRow:row].viewerNum).stringValue;
}
@end
