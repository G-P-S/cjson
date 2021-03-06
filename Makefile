PREFIX := /usr/local

CFLAGS ?= 
CFLAGS_EXTRA := -fPIC
LDFLAGS += -shared 
LIBS = -lm
UNAME = $(uname)
ifeq ($(UNAME),Darwin)
		AR := ar rcs
else
		AR := libtool -o
endif

all:	libcJSON.so libcJSON.a

libcJSON.a: cJSON.o
	$(AR) $@ $^

libcJSON.so: cJSON.o
	#$(LD) $(LDFLAGS) -o $@ $^
	$(CC) $(CFLAGS) --shared -o $@ $^

cJSON.o: cJSON.c
	$(CC) $(CFLAGS) $(CFLAGS_EXTRA) -c $< $(LIBS)

clean:
	rm -f *.o *.so *.a test

install: libcJSON.so
	install -m0755 libcJSON.so $(PREFIX)/lib/
	install -m0755 libcJSON.a $(PREFIX)/lib/
	install -m0644 cJSON.h $(PREFIX)/include/
	ldconfig

test: test.c
	$(CC) -o test test.c $(CFLAGS) $(CFLAGS_EXTRA) -lcJSON -lm -L. -L$(PREFIX)/lib/ -I$(PREFIX)/include/
