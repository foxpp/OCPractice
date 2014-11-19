#define DECLARE_SINGLETON_METHOD(className) \
+(className*)shared##className;

#define DEFINE_SINGLETON_METHOD(className) \
+(className*)shared##className;\
{\
static className * sharedInstance = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
sharedInstance  = [[className alloc]init];\
});\
return sharedInstance;\
}
