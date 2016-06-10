//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Colin Walsh on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart




-(NSUInteger)calculateTotalPriceInCents{
    
    FISShoppingCart *shoppingCart = [[FISShoppingCart alloc] init];
    shoppingCart.items = [[NSMutableArray alloc] init];
    
    NSInteger sum = 0;
    for (FISItem *item in self.items) {
        sum += item.priceInCents;
    }
    
    return sum;
}
-(void)addItem:(FISItem*)item{
    [self.items addObject:item];
    }
-(void)removeItem:(FISItem*)item{
    
    [self.items removeObjectAtIndex:[self.items indexOfObject:item]];
    }

-(void)removeAllItemsLikeItem:(FISItem*)item{
    for (NSUInteger i = 0; i < [self.items count]; i++) {
        [self.items removeObjectAtIndex:[self.items indexOfObject:item]];
    }
    
    }
-(void)sortItemsByNameAsc{
    NSSortDescriptor* sortAsc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    [self.items sortUsingDescriptors:@[sortAsc]];
    
    }
-(void)sortItemsByNameDesc{
    NSSortDescriptor* sortDesc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    
    [self.items sortUsingDescriptors:@[sortDesc]];
    }
-(void)sortItemsByPriceInCentsAsc{
    NSSortDescriptor* sortAscPrice = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:YES];
    
    [self.items sortUsingDescriptors:@[sortAscPrice]];
    }
-(void)sortItemsByPriceInCentsDesc{
    NSSortDescriptor* sortDescPrice = [[NSSortDescriptor alloc] initWithKey:@"priceInCents" ascending:NO];
    
    [self.items sortUsingDescriptors:@[sortDescPrice]];
    }
-(NSArray*)allItemsWithName:(NSString*)name{
    

    
    NSPredicate* findName = [NSPredicate predicateWithFormat:@"name LIKE %@",name];
    
    NSArray* arrayWithSameNames = [self.items filteredArrayUsingPredicate:findName];
    
    return arrayWithSameNames;}
-(NSArray*)allItemsWithMinimumPriceInCents:(NSUInteger)priceInCents{
    
    NSPredicate* findMinPrice = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", priceInCents];
    
    NSArray* filteredArray = [self.items filteredArrayUsingPredicate:findMinPrice];
    
    return filteredArray;}
-(NSArray*)allItemsWithMaximumPriceInCents:(NSUInteger)priceInCents{
    
    NSPredicate* findMaxPrice = [NSPredicate predicateWithFormat:@"priceInCents <= %lu", priceInCents];
    
    NSArray* filteredArray = [self.items filteredArrayUsingPredicate:findMaxPrice];
    
    return filteredArray;
    }


@end
