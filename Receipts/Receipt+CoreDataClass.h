//
//  Receipt+CoreDataClass.h
//  Receipts
//
//  Created by Tim Beals on 2016-11-24.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tag;

NS_ASSUME_NONNULL_BEGIN

@interface Receipt : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Receipt+CoreDataProperties.h"
