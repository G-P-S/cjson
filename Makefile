PREFIX := /usr/local

CFLAGS ?= 
CFLAGS_EXTRA := -fPIC
LDFLAGS += -shared 
LIBS = -lm

all:	libcJSON.so libcJSON.a

libcJSON.a: cJSON.o
	ar rcs $@ $^

libcJSON.so: cJSON.o
	#$(LD) $(LDFLAGS) -o $@ $^
	$(CC) $(CFLAGS) --shared -o $@ $^

cJSON.o: cJSON.c
	$(CC) $(CFLAGS) $(CFLAGS_EXTRA) -c $< $(LIBS)

clean:
	rm -f *.o *.so test

install: libcJSON.so
	install -m0755 libcJSON.so $(PREFIX)/lib/
	install -m0755 libcJSON.a $(PREFIX)/lib/
	install -m0644 cJSON.h $(PREFIX)/include/
	ldconfig

test:
	$(CC) -o test test.c -lcJSON -lm -L$(PREFIX)/lib/ -I$(PREFIX)/include/
