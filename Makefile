# Makefile for attint85sim
PROJPATH	:= $(PWD)
USRTGT		:= $(shell basename $(PROJPATH))
TSTTGT		:= test-app

# build sources
USRCS	:= $(wildcard src/*.cpp)
LSRCS	:= $(wildcard lib/*.cpp)
TSRCS	:= $(wildcard tests/*.cpp)

CFLAGS	:= -Iinclude -std=c++11

# build tools
CXX	:=	g++
AR	:= ar
RM	:= rm -f

# build object files
UOBJS	:= $(USRCS:.cpp=.o)
LOBJS	:= $(LSRCS:.cpp=.o)
TOBJS	:= $(TSRCS:.cpp=.o)

LIB		:= $(USRTGT)lib.a

.PHONY: all
all:	$(USRTGT) $(TSTTGT)	## build all targets

.PHONY: run
run:	$(USRTGT)
	./$(USRTGT)

.PHONY: test
test:	$(TSTTGT)
	./$(TSTTGT)

.PHONY: tests
tests:	$(TSTTGT)	## build test objects


$(LIB):	$(LOBJS)
	$(AR) rcs $@ $^


$(USRTGT):	$(UOBJS) $(LIB)
	$(CXX) $(LFLAGS) $^ -o $@

$(TSTTGT):	$(TOBJS) $(LIB)
	$(CXX) -o $@ $^

%.o:	%.cpp
	$(CXX) -c $(CFLAGS) -o $@ $<

clean:
	$(RM) $(USRTGT) $(TSTTGT) \
		$(LIB) $(UOBJS) $(LOBJS) $(TOBJS)

