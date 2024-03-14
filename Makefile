CFLAGS := -Wall -O0 -ggdb
LEX_SRC := ./scanner.l
COMPILER := scanner
BUILD := ./build
BUILD_OUT := out

COMPILER_OUT := ${BUILD}/${BUILD_OUT}/${COMPILER}
LEX_OUT := ${BUILD}/lex.yy.c

all: build run

create_build_folder:
	mkdir -p ${BUILD}
	mkdir -p ${BUILD}/${BUILD_OUT}

build: create_build_folder lex.yy.c
	$(info ########## Compile Scanner ##########)
	gcc ${CFLAGS} -iquote ./ -iquote ../ -o ${COMPILER_OUT} ${LEX_OUT}

lex.yy.c:
	$(info ########## Compile Lex ##########)
	lex -o ${LEX_OUT} ${LEX_SRC}

run:
	$(info ########## Run Scanner ##########)
	@${COMPILER_OUT}

clean:
	rm -rf ${BUILD}
