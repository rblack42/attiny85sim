# Makefile for attint85sim
PROJPATH	:= $(PWD)
USRTGT		:= $(shell basename $(PROJPATH))
TSTTGT		:= test-app
VERSION		:= $(shell cat .version)
BUILD		:= $(shell cat .build)

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
	./scripts/inc_build.sh

$(TSTTGT):	$(TOBJS) $(LIB)
	$(CXX) -o $@ $^

%.o:	%.cpp
	$(CXX) -c $(CFLAGS) -o $@ $<

clean:
	$(RM) $(USRTGT) $(TSTTGT) \
		$(LIB) $(UOBJS) $(LOBJS) $(TOBJS)

# version management
.PHONY: version
version: ## show current project version
	@if ! ([ -f .version ]); then \
		echo "v0.0.0" > .version; \
	fi
	cat .version

.PHONY: build
build: ## show current project build number
	@if ! ([ -f .build ]); then \
		echo "0" > .build; \
	fi
	cat .build


.PHONY:	tag
tag: ## tag this version
	@echo $(VERSION)
	git tag -a $(VERSION) -m "Auto tag $(VERSION)"

.PHONY: bump-build
bump-build:	## bump version build number
	./scripts/inc_version.sh build;

.PHONY: bump-feature
bump-feature: ## bump version feature number
	./scripts/inc_version.sh minor

.PHONY: bump-release
bump-release: ## bump version release number
	./scripts/inc_version.sh major


