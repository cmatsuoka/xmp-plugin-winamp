VERSION	= 4.0.0
CC	= i686-w64-mingw32-gcc
CFLAGS	= -I../libxmp/include -DVERSION=\"$(VERSION)\"
LD	= i686-w64-mingw32-gcc
LDFLAGS	= -shared -mwindows
WINDRES = i686-w64-mingw32-windres
OBJS	= winamp.o resource.o
LIBS	= -L. -lxmp

.SUFFIXES: .c .o .rc .dll

.c.o:
	$(CC) -c $(CFLAGS) -o $*.o $<

.rc.o:
	$(WINDRES) -o$@ $<

plugin-winamp: in_xmp.dll

in_xmp.dll: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

clean:
	rm *.o

$(OBJS): Makefile

winamp.o: winamp.c resource.h in2.h out.h

resource.o: resource.rc resource.h

