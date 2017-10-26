#import <Foundation/Foundation.h>
///////////////////////////////////
// How to build and execute
//
// Build:
// clang -framework Foundation -o yes yes.m
//
// option 1 - output 'yes'
// ./yes
//
// option 2 - output argument list
// ./yes argument_list

int main() {
	NSArray* args = [[NSProcessInfo processInfo] arguments];
	NSFileHandle* stdout = [NSFileHandle fileHandleWithStandardOutput];
	NSData* data = nil;
	if ([args count] == 1) {
		data = [@"y\n" dataUsingEncoding: NSUTF8StringEncoding];
	} else {
		NSRange rn;
		rn.location = 1;
		rn.length = [args count] - 1;

		data = [[NSString stringWithFormat:@"%@\n", [[args subarrayWithRange: rn] componentsJoinedByString: @" "]] dataUsingEncoding: NSUTF8StringEncoding];
	}

	while (true) {
		[stdout writeData:data];
	}
}

