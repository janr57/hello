# Makefile
# Creates 'hello' executable.
# Dependencies:
# * sbcl, ccl or ecl
# * quicklisp
#
# The 'hello' program prints "Hello world!" in the standard output.
#
# Copyright (c) 2020 - José A. Navarro Ramón <janr.devel@gmail.com>
# License: BSD 3-Clause

sysname = hello
target1 = $(sysname)_sbcl
target2 = $(sysname)_ccl
target3 = $(sysname)_ecl

FILES = src/packages.lisp \
	src/main.lisp 

all: $(target1) $(target2) $(target3)

$(target1): $(FILES)
	$(RM) $(sysname)
	sbcl --eval "(asdf:make :$(sysname)/executable)"
	mv $(sysname) $(target1)

$(target2): $(FILES)
	$(RM) $(sysname)
	ccl --eval "(asdf:make :$(sysname)/executable)"
	mv $(sysname) $(target2)

$(target3): $(FILES)
	$(RM) $(sysname)
	ecl --load "./make-asdf-exec.lisp"
	mv $(sysname) $(target3)


.PHONY: clean

clean:
	$(RM) $(target1) $(target2) $(target3) $(sysname)
	$(RM) *~ src/*.fasl src/*~ src/*.o *slime-repl* *.exe src/hello



