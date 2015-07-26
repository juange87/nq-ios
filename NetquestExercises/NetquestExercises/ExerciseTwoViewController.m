//
//  ExerciseTwoViewController.m
//  NetquestExercises
//
//  Created by Juan Jesus Fernandez Madrid on 25/7/15.
//  Copyright (c) 2015 Juan Jesus Fernandez Madrid. All rights reserved.
//

#import "ExerciseTwoViewController.h"
#import "ImageCollectionViewCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface ExerciseTwoViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSArray *urlsArray;

@property (strong, nonatomic) NSString *apiUrl;

@end


@implementation ExerciseTwoViewController

@synthesize collectionView;
@synthesize urlsArray = _urlsArray;
@synthesize apiUrl = _apiUrl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Exercise Two";
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"NetquestImageCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - COLLECTION VIEW

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return [self.urlsArray count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *url_id = [self.urlsArray objectAtIndex:indexPath.row];
    NSString *url = [self.apiUrl stringByAppendingString:url_id];
    NSLog(@"url: %@", url);
    
    ImageCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"NetquestImageCell" forIndexPath:indexPath];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:url]
                      placeholderImage:[UIImage imageNamed:@"logo.png"]];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize cellSize = CGSizeMake(120.f, 120.f);
    
    return cellSize;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark - LAZY LOAD

- (NSString *) apiUrl {
    if (!_apiUrl) {
        _apiUrl = @"https://www.nicequest.com/portal_nicequest_api/DocumentServlet?docid=";
    }
    return _apiUrl;
}

- (NSArray *) urlsArray {
    if (!_urlsArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"url_ids" ofType:@"plist"];
        NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        _urlsArray = [[NSArray alloc] initWithArray:[plistDict objectForKey:@"urls"]];
    }
    return _urlsArray;
}

@end
