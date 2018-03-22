//
//  Const.h
//  huabo
//
//  Created by admin on 14-3-5.
//  Copyright (c) 2014年 zy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define AllSystemColor \
[UIColor colorWithRed:((float)((0x4bbcf1 & 0xFF0000) >> 16))/255.0 \
green:((float)((0x4bbcf1 & 0xFF00) >> 8))/255.0 \
blue:((float)(0x4bbcf1 & 0xFF))/255.0 \
alpha:1.0]

#define PropertyString(p) @property(nonatomic,copy) NSString *p
#define PropertyFloat(p) @property (nonatomic, assign) float p;
#define PropertyInt(p) @property (nonatomic, assign) NSInteger p;
#define PropertyUInt(p) @property (nonatomic, assign) NSUInteger p;
#define PropertyBool(p) @property (nonatomic,assign) BOOL p;
#define PropertyLong(p) @property (nonatomic,assign) long p;
//@property (retain,nonatomic) NSNumber *num
#define PropertyNumber(p) @property (nonatomic,retain) NSNumber *p;

#define NAVI_HEIGHT 64
#define UI_NAVI_COLOR [UIColor colorWithRed:235/255.0 green:80/255.0 blue:80/255.0 alpha:1.0]
#define TABBARHEIGHT 48
#define TEACHER_SCULPTURE  @"tsculpture"
#define HEADMASTER_SCULPTURE @"hsculpture"

//选项圈颜色
#define RADIO_COLOR_RED    [UIColor colorWithRed:207/255.0 green:90/255.0 blue:106/255.0 alpha:1.0]
#define RADIO_COLOR_YELLOW [UIColor colorWithRed:242/255.0 green:172/255.0 blue:83/255.0 alpha:1.0]
#define RADIO_COLOR_BLUE   [UIColor colorWithRed:63/255.0 green:183/255.0 blue:212/255.0 alpha:1.0]
#define RADIO_COLOR_GREEN  [UIColor colorWithRed:86/255.0 green:190/255.0 blue:137/255.0 alpha:1.0]

#define RADIO_COLOR_GRAY   [UIColor colorWithRed:125/255.0 green:125/255.0 blue:125/255.0 alpha:1.0]

#define RADIO_COLOR_BROWN  [UIColor colorWithRed:170/255.0 green:150/255.0 blue:153/255.0 alpha:1.0]

#define CELL_IMAGE_SCALE 0.8

#define BEGIN_POST  NSMutableDictionary * dict =[[NSMutableDictionary alloc] init];   \
[dict setValue:[[[UserManger sharedInstance] modelS] app_id] forKey:@"app_id"];    \
[dict setValue:[[[UserManger sharedInstance] modelS] token_id] forKey:@"token_id"];



#define DEFAULT_HTTPHANDLE_BLOCK  ^(id json){ }

//
//#define BEGIN_PULLTOREFRESH    __weak UITableView * weakTable=_table;  \
//[_table addPullToRefreshWithActionHandler:^(void){                     \
//[weakTable.pullToRefreshView setTitle:@"刷新中..." forState:          SVPullToRefreshStateLoading];                                      \
//[weakTable.pullToRefreshView setTitle:@"释放刷新" forState:           SVPullToRefreshStateTriggered];                                    \
//[weakTable.pullToRefreshView setTitle:@"下拉刷新" forState:   SVPullToRefreshStateStopped];
//
//
//#define END_PULLTOREFRESH    }];




//将网络时间格式转成字符串
#define CHANGE_NETTIME_STRING(sec) [NSString stringWithFormat:@"%02ld:%02ld",(sec-10000)/100, sec-(sec-10000)/100*100-10000 ]

#define CHANGE_NETDATE_STRING(date) [NSString stringWithFormat:@"%d-%02d-%02d",date/10000,(date-date/10000*10000)/100,date-date/10000*10000-(date-date/10000*10000)/100 *100]

#define REQUEST_SUCCESS(dic) if([[dic valueForKey:@"session"] boolValue]&& [[dic valueForKey:@"success"] boolValue])

#define SAFE_ARRAY(obj)      if(obj!=nil && [obj isKindOfClass:[NSArray class]])

#define HAVE_MESSAGE(dic)    if([dic objectForKey:@"msg"]!=nil  && ![[dic objectForKey:@"msg"] isEqualToString:@""] && [[dic valueForKey:@"session"] boolValue])                            \
{                                                            \
    [zyDevice showHUDInWindowWithText:[dic objectForKey:@"msg"]];\
}

#define VERIFY_DIC(dic,keyname)   if([dic valueForKey:keyname]!=nil && [[dic valueForKey:keyname] isKindOfClass:[NSDictionary class]])


#define UI_TEXT_COLOR [UIColor colorWithRed:106/255.0 green:106/255.0 blue:106/255.0 alpha:1.0]

#define UI_BG_COLOR [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0]
#define UI_BTN_COLOR  [UIColor colorWithRed:239/255.0 green:183/255.0 blue:53/255.0 alpha:1.0]
////////heyha接口
#define SAC_PROJECT_URL  @"http://ios.teacher.sac.heyha.com/heyha_sac"
//认证中心url
#define EDU_PROJECT_URL  @"http://ios.teacher.edu.heyha.com/heyha_edu"
//教务教学url
#define IMAGE_PROJECT_URL @"http://ios.teacher.image.heyha.com/heyha_image"

#define VERSION_PROJECT_URL @"http://ios.teacher.version.heyha.com/heyha_version"

//////////////
////////////heyha接口
//#define SAC_PROJECT_URL    @"http://192.168.0.24/heyha_sac"
////认证中心url
//#define EDU_PROJECT_URL    @"http://192.168.0.24/heyha_edu"
////教务教学url
//#define IMAGE_PROJECT_URL @"http://192.168.0.24/heyha_image"
//#define VERSION_PROJECT_URL @"http://192.168.0.24/heyha_version"
////////
#define kLoginUrl(str)   [NSString stringWithFormat:@"%@%@",SAC_PROJECT_URL,str]
#define kBaseUrl(str)    [NSString stringWithFormat:@"%@%@",EDU_PROJECT_URL,str]
#define kImageUrl(str)   [NSString stringWithFormat:@"%@%@",IMAGE_PROJECT_URL,str]

#define kVersionUrl(str) [NSString stringWithFormat:@"%@%@",VERSION_PROJECT_URL,str]



//登录
#define GET_VERSION kVersionUrl(@"/versionController/getVersion.login")


#define LOGIN_URL_PART @"/sacLoginController/getSacUser.login"
#define LOGIN_URL  kLoginUrl(@"/sacLoginController/getSacUser.login")

#define LOGOUT_URL kLoginUrl(@"/sacLoginController/deleteSacLogin.login")
///////////////教师端
//人脸识别
//上传人脸图片
#define UPLOAD_FACE_PIC kImageUrl(@"/sacChildrenFaceImageController/insertSacChildrenFaceImage.upload")
//插入小朋友纪录
#define INSERT_CHILD    kLoginUrl(@"/sacChildrenFaceController/insertSacChildrenFace.json")

//获取学生档案列表
#define GET_FILES_URL kLoginUrl(@"/sacChildrenFaceController/selectSacChildrenIsFaceList.json")
//获取某个学生的档案
#define GET_CHILD_FILE kLoginUrl(@"/sacChildrenFaceController/selectSacChildrenFaceList.json")
//获取某个学生的脸
#define GET_CHILD_FACE kImageUrl(@"/sacChildrenFaceImageController/getSacChildrenFaceImage.download")
//删除学生档案
#define DELETE_CHILD_FILE kLoginUrl(@"/sacChildrenFaceController/deleteSacChildrenFace.json")
//删除学生的脸
#define DELETE_CHILD_FACE kImageUrl(@"/sacChildrenFaceImageController/deleteSacChildrenFaceImage.json")

//批准假条
#define APPROVALNOTE_URL_PART @"/eduKqChildrenLeaveController/updateEduKqChildrenLeaveAgree.json"
#define APPROVALNOTE_URL kBaseUrl(@"/eduKqChildrenLeaveController/updateEduKqChildrenLeaveAgree.json")
//获取课程列表
#define CLASSLIST_URL_PART  @"/eduByLessonCaseController/selectEduByLessonCaseList.json"
#define CLASSLIST_URL kBaseUrl(@"/eduByLessonCaseController/selectEduByLessonCaseList.json")
//获取考勤列表

#define ATTENDANCE_URL kBaseUrl(@"/eduKqAttendController/selectEduKqAttendTeacherList.json")
//获取考勤详情
#define ATTENDANCE_DETAIL_URL kBaseUrl(@"/eduKqAttendController/selectEduKqAttendDetailsTeacherList.json")
//获取未查看假条数目
#define GET_NOTREAD_COUNT     kBaseUrl(@"/eduKqChildrenLeaveController/getEduKqChildrenLeaveNoRatifyCount.json")
//保存考勤详情
#define SAVE_ATTENDANCE_DETAIL_URL kBaseUrl(@"/eduKqAttendController/insertEduKqAttend.json")
//获取课堂学生详情
#define CLASSDETAIL_URL_PART @"/eduByChildrenCaseController/selectEduByChildrenCaseList.json"
#define CLASSDETAIL_URL kBaseUrl(@"/eduByChildrenCaseController/selectEduByChildrenCaseList.json")
//提交学生状态
#define UPDATE_CHILDREN_STATE_PART @"/eduByChildrenCaseController/insertEduByChildrenCase.json"
#define UPDATE_CHILDREN_STATE kBaseUrl(@"/eduByChildrenCaseController/insertEduByChildrenCase.json")
//更新作息时间
#define UPDATELESSONTIME_URL_PART  @"/eduByLessonController/updateEduByLessonTime.json"
#define UPDATELESSONTIME_URL kBaseUrl(@"/eduByLessonController/updateEduByLessonTime.json")
//获取假条列表
#define GETNOTESLIST_URL_PART @"/eduKqChildrenLeaveController/selectEduKqChildrenLeaveList.json"
#define GETNOTESLIST_URL kBaseUrl(@"/eduKqChildrenLeaveController/selectEduKqChildrenLeaveFromTeacherList.json")

//获取历史假条列表
#define GET_HISTORYNOTE_URL kBaseUrl(@"/eduKqChildrenLeaveController/selectEduKqChildrenLeaveHistoryList.json")


//#define REPORT_STUDENTS_URL kBaseUrl(@"/eduByChildrenCaseController/insertEduByChildrenCase.json")
//获取假条图片
#define GETNOTEPIC_URL_PART @"/eduKqChildrenLeaveImageController/getEduKqChildrenLeaveImage.download"
#define GETNOTEPIC_URL kImageUrl(@"/eduKqChildrenLeaveImageController/getEduKqChildrenLeaveImage.download")
//获取假条详情
#define GET_NOTE_DETAIL kBaseUrl(@"/eduKqChildrenLeaveController/getEduKqChildrenLeaveFromTeacher.json")

//修改密码
#define CHANGE_PASSWORD_URL kLoginUrl(@"/sacLoginController/updateSacLoginPwd.json")
////////////////园长端
//首页数据
//获取作息时间列表
#define GET_TIME_URL_PART  @"/eduByLessonController/selectEduByLessonTimeList.json"
#define GET_TIME_URL kBaseUrl(@"/eduByLessonController/selectEduByLessonTimeList.json")
//获取首页数据
#define KINDERGARTEN_URL_PART @"/eduByLessonCaseController/selectEduByLessonCaseGartenList.json"
#define KINDERGARTEN_URL kBaseUrl(@"/eduByLessonCaseController/selectEduByLessonCaseGartenList.json")
//获取考勤列表
#define GET_ATTENDANCE_URL kBaseUrl(@"/eduKqAttendController/selectEduKqAttendGartenList.json")

//获取考勤未发送报告
#define GET_NOTSEDN_URL kBaseUrl(@"/eduKqAttendController/selectEduKqAttendNoSendDetailsGartenList.json")
//获取未如园 未离园报告
#define GET_WRY_OR_WLY  kBaseUrl(@"/eduKqAttendController/selectEduKqAttendIngEdDetailsGartenList.json")

//获取异常报告
#define KINDERGARTEN_EXCEPTION_URL_PART @"/eduByLessonCaseController/selectEduByLessonCaseGartenExceptionList.json"
#define KINDERGARTEN_EXCEPTION_URL kBaseUrl(@"/eduByLessonCaseController/selectEduByLessonCaseGartenExceptionList.json")
//////修改默认评语
#define CHANGE_GOOD_NAME_PART @"/eduByLessonCaseController/updateEduByLessonCaseGoodName.json"
#define CHANGE_GOOD_NAME  kBaseUrl(@"/eduByLessonCaseController/updateEduByLessonCaseGoodName.json")

#define CHANGE_GENERAL_NAME_PART  @"/eduByLessonCaseController/updateEduByLessonCaseGeneralName.json"
#define CHANGE_GENERAL_NAME  kBaseUrl(@"/eduByLessonCaseController/updateEduByLessonCaseGeneralName.json")

#define CHANGE_POOR_NAME_PART @"/eduByLessonCaseController/updateEduByLessonCasePoorName.json"
#define CHANGE_POOR_NAME kBaseUrl(@"/eduByLessonCaseController/updateEduByLessonCasePoorName.json")


#define GET_EXCEPTIONREPORT_URL_PART @"/eduByLessonCaseController/selectEduByLessonCaseGartenExceptionList.json"
#define GET_EXCEPTIONREPORT_URL kBaseUrl(@"/eduByLessonCaseController/selectEduByLessonCaseGartenExceptionList.json")

#define GET_INDIVIDUAL_URL_PART @"/eduByLessonCaseController/selectEduByLessonCaseGartenIndividuationList.json"
#define GET_INDIVIDUAL_URL kBaseUrl(@"/eduByLessonCaseController/selectEduByLessonCaseGartenIndividuationList.json")

#define GET_UNCOMMITTED_URL_PART @"/eduByLessonCaseController/selectEduByLessonCaseGartenUncommittedList.json"
#define GET_UNCOMMITTED_URL kBaseUrl(@"/eduByLessonCaseController/selectEduByLessonCaseGartenUncommittedList.json")



// RabbitMq
#define GET_RABBITMQ_CONFIG kBaseUrl(@"/eduBaseController/getMqConfiguration.json")
//@"http://edu.heyha.com/
///eduByLessonController/updateEduByLessonTime.json

////////家长段接口，用于区分推送时不同的请求
//请假
#define ASKFORLEAVE_URL_PART @"/eduKqChildrenLeaveController/insertEduKqChildrenLeave.json"
//全局变量
float      screenWidth;
float      screenHeight;


BOOL       beTeacher;

BOOL       beWorkday;
BOOL       CHECKED;

// faceplusplus
#define FACE_API_KEY    @"34172a6abdad8152c345748184845528"
#define FACE_API_SECRET @"o1R72A7NB4lS37NjqUTAiHoGFrZe79Wf"




