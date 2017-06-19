//
//  ProductInfomationTableViewCell.m
//  MagicCubeKit
//
//  Created by LuisX on 2017/6/1.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ProductInfomationTableViewCell.h"
#import "ProductSaleTagView.h"
#import "ProductSpecialTimeView.h"
@implementation ProductInfomationTableViewCell{
    UILabel *_titleLabel;                       //标题
    UILabel *_subtitleLabel;                    //副标题
    UILabel *_priceLabel;                       //价格
    UIView  *_priceBackgroundView;              //价格背景
    UIImageView *_specialBGImageView;           //特卖背景
    ProductSaleTagView *_commissionTagView;     //佣金
    ProductSaleTagView *_byStagesTagView;       //分期
    ProductSpecialTimeView *_specialTimeView;   //特卖时间
    UIView *_onLineStatisticsView;              //上架统计视图
    UIView *_onLineBackgroundView;              //上架背景
    UILabel *_onLineIconLabel;                  //上架icon
    UILabel *_onLineCountLabel;                 //上架数目
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self registerNSNotificationCenter];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createSubViews];
        [self settingAutoLayout];
    }
    return self;
}

- (void)createSubViews{
    
    _titleLabel = [UILabel new];
    _titleLabel.textColor = [UIColor colorWithRed:0.10 green:0.07 blue:0.06 alpha:1.00];
    _titleLabel.font = [UIFont boldSystemFontOfSize:16];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];
    
    _subtitleLabel = [UILabel new];
    _subtitleLabel.textColor = [UIColor colorWithRed:0.96 green:0.22 blue:0.33 alpha:1.00];
    _subtitleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_subtitleLabel];
    
    _specialBGImageView = [UIImageView new];
    _specialBGImageView.image = [UIImage imageNamed:@"productDetailTag@2x.png"];
    [self.contentView addSubview:_specialBGImageView];
    
    _priceBackgroundView = [UIView new];
    [_specialBGImageView addSubview:_priceBackgroundView];
    
    _priceLabel = [UILabel new];
    _priceLabel.font = [UIFont boldSystemFontOfSize:22];
    _priceLabel.textColor = [UIColor whiteColor];
    _priceLabel.numberOfLines = 0;
    [_priceBackgroundView addSubview:_priceLabel];

    _commissionTagView = [ProductSaleTagView new];
    _commissionTagView.fontSize = 12;
    _commissionTagView.height = 19;
    _commissionTagView.textColor = [UIColor whiteColor];
    _commissionTagView.borderColor = [UIColor whiteColor];
    [_priceBackgroundView addSubview:_commissionTagView];
    
    _specialTimeView = [ProductSpecialTimeView new];
    [self.contentView addSubview:_specialTimeView];

    _byStagesTagView = [ProductSaleTagView new];
    _byStagesTagView.textColor = [UIColor colorWithRed:0.50 green:0.50 blue:0.50 alpha:1.00];
    _byStagesTagView.fontSize = 10;
    _byStagesTagView.height = 23;
    _byStagesTagView.borderColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    _byStagesTagView.bgColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    [self.contentView addSubview:_byStagesTagView];
    
    [self createOnLineStatisticsView];
}

- (void)createOnLineStatisticsView{
    
    _onLineStatisticsView = [UIView new];
    _onLineStatisticsView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    [self.contentView addSubview:_onLineStatisticsView];
    
    _onLineBackgroundView = [UIView new];
    [_onLineStatisticsView addSubview:_onLineBackgroundView];
    
    _onLineIconLabel = [UILabel new];
    _onLineIconLabel.font = [UIFont fontWithName:@"iconfont" size:12];
    _onLineIconLabel.text = @"\U0000e6f1";
    _onLineIconLabel.textColor = [UIColor colorWithRed:0.96 green:0.22 blue:0.33 alpha:1.00];
    [_onLineStatisticsView addSubview:_onLineIconLabel];
    
    _onLineCountLabel = [UILabel new];
    _onLineCountLabel.textColor = [UIColor colorWithRed:0.50 green:0.50 blue:0.50 alpha:1.00];
    _onLineCountLabel.font = [UIFont systemFontOfSize:12];
    [_onLineStatisticsView addSubview:_onLineCountLabel];
    
}

- (void)settingAutoLayout{
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.centerX.equalTo(self.contentView);
        make.width.mas_equalTo(Magic_screen_Width - 40);
    }];
    
    [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.contentView);
    }];
    
    [_specialBGImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_subtitleLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.contentView);
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(70);
    }];
    
    [_priceBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.centerX.equalTo(_specialBGImageView);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_priceBackgroundView);
        make.left.equalTo(_priceBackgroundView);
    }];
    
    [_commissionTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_priceLabel.mas_right).offset(6);
        make.centerY.equalTo(_priceBackgroundView);
        make.right.equalTo(_priceBackgroundView);
    }];

    [_specialTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(_specialBGImageView.mas_bottom).offset(10);
    }];
    
    [_byStagesTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(_specialTimeView.mas_bottom);
    }];
    

    [_onLineStatisticsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_byStagesTagView.mas_bottom).offset(25);
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(32);
    }];
    
    [_onLineBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_onLineStatisticsView);
        make.centerX.equalTo(_onLineStatisticsView);
    }];
    
    [_onLineIconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_onLineBackgroundView);
        make.left.equalTo(_onLineBackgroundView);
    }];
    
    [_onLineCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_onLineIconLabel.mas_right).offset(5);
        make.centerY.equalTo(_onLineBackgroundView);
        make.right.equalTo(_onLineBackgroundView);
    }];
}


#pragma mark -更新数据
- (void)setProductDetailModel:(ProductDetailModel *)productDetailModel{
    
    if (_productDetailModel != productDetailModel) {
        _productDetailModel = productDetailModel;
    }
    _titleLabel.text = [NSString stringWithFormat:@"%@", _productDetailModel.item.productTitle];
    _subtitleLabel.text = @"本商品为预售商品";
    _priceLabel.text = [NSString stringWithFormat:@"¥%.2f", _productDetailModel.item.price];
    _commissionTagView.title = [NSString stringWithFormat:@"赚¥%.2f", _productDetailModel.commission];
    _byStagesTagView.title = [NSString stringWithFormat:@"%@", _productDetailModel.byStages];
    _onLineCountLabel.text = [self checkGoodsShelvesCountWithShelvesCount:_productDetailModel.item.ID];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//检查上架数量
- (NSString *)checkGoodsShelvesCountWithShelvesCount:(CGFloat)shelvesCount{
    
    if (shelvesCount < 10000) {
        return [NSString stringWithFormat:@"已被%.f位店主上架", shelvesCount];
    }
    
    return [NSString stringWithFormat:@"已被%.1f万位店主上架", (shelvesCount / 10000)];
    
}


#pragma mark - 倒计时相关
- (void)dealloc {
    [self removeNSNotificationCenter];
}

#pragma mark - 通知中心
- (void)registerNSNotificationCenter{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationCenterEvent:)
                                                 name:NOTIFICATION_TIME_CELL
                                               object:nil];
}

- (void)removeNSNotificationCenter{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_TIME_CELL object:nil];
}

- (void)notificationCenterEvent:(id)sender{
    if (self.m_isDisplayed) {
        NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:_productDetailModel.skuCommission.startTime / 1000];
        NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:_productDetailModel.skuCommission.endTime / 1000];
        NSDate *nowDate = [NSDate date];
        if ([nowDate isEarlierThan:endDate]) {
            _specialTimeView.productDetailModel = _productDetailModel;
        }else{
            [_specialTimeView recoverProductSpecialTimeStyleNone];
        }
    }
}
@end
