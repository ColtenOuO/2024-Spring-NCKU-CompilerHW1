CFLAGS := -Wall -O0 -ggdb
LEX_SRC := ./compiler.l
COMPILER := compiler
BUILD := ./build
BUILD_OUT := out

COMPILER_OUT := ${BUILD}/${BUILD_OUT}/${COMPILER}
LEX_OUT := ${BUILD}/lex.yy.c

all: create_build_folder create_compiler run

create_build_folder:
	mkdir -p ${BUILD}
	mkdir -p ${BUILD}/${BUILD_OUT}

create_compiler: lex.yy.c
	$(info ########## Compile Compiler ##########)
	gcc ${CFLAGS} -iquote ./ -iquote ../ -o ${COMPILER_OUT} ${LEX_OUT}

lex.yy.c:
	$(info ########## Compile Lex ##########)
	lex -o ${LEX_OUT} ${LEX_SRC}

run:
	$(info ########## Run Compiler ##########)
	@${COMPILER_OUT} output

clean:
	rm -rf ${BUILD}
