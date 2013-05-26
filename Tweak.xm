#include <substrate.h>

// Hooking OpenSSL
#include <openssl/ssl.h>


// Hook SSL_CTX *SSL_CTX_new();
static SSL_CTX *(*original_SSL_CTX_new)(const SSL_METHOD *method);

static SSL_CTX *replaced_SSL_CTX_new(const SSL_METHOD *method) {
	NSLog(@"====HOOKED SSL_CTX_new()====");
    return original_SSL_CTX_new(method);
}


%ctor {
	NSLog(@"====STARTING====");
	MSHookFunction((void *) SSL_CTX_new,(void *)  replaced_SSL_CTX_new, (void **) &original_SSL_CTX_new);
}