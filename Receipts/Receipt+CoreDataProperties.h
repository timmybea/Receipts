//
//  Receipt+CoreDataProperties.h
//  Receipts
//
//  Created by Tim Beals on 2016-11-24.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "Receipt+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Receipt (CoreDataProperties)

+ (NSFetchRequest<Receipt *> *)fetchRequest;

@property (nonatomic) float amount;
@property (nullable, nonatomic, copy) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSSet<Tag *> *relationship;

@end

@interface Receipt (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(Tag *)value;
- (void)removeRelationshipObject:(Tag *)value;
- (void)addRelationship:(NSSet<Tag *> *)values;
- (void)removeRelationship:(NSSet<Tag *> *)values;

@end

NS_ASSUME_NONNULL_END
