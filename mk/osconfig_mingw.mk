#
# System config
#
LN = cp
RM = rm -f
DOT =
slash = \\

win32 = win32
system = system

#
# OCaml configuration
#
OCAMLSUFFIX =
OCAMLC = ocamlc$(OCAMLSUFFIX)
OCAMLOPT = ocamlopt$(OCAMLSUFFIX)
OCAMLYACC = ocamlyacc
OCAMLLEX = ocamllex$(OCAMLSUFFIX)
OCAMLDEP = ocamldep$(OCAMLSUFFIX)

#
# C configuration
#
CC = $(OCAML_CC)
CFLAGS = $(OCAML_CFLAGS) -I"$(STDLIB)" -I"$(STDLIB)/caml"
AR = ar cq
AROUT =
EXT_OBJ = .o
EXT_LIB = .a
EXE = .exe
CCOMPTYPE = cc

OCAMLFLAGS = -safe-string -strict-sequence -thread -w +a-4-32-30-42-40-41-48-50-52-60 -g $(OCAMLFLAGS_EXTRA)
THREADSLIB = threads.cma
THREADSLIB_OPT = threads.cmxa
PREFERRED = .byte
STDLIB := $(shell $(OCAMLC) -where)

.SUFFIXES: .mll .mly .mli .ml .c .cmi .cmo .cmx .cma .cmxa .o

.c.o:
	$(CC) $(CFLAGS) -c $*.c

.mly.ml:
	$(OCAMLYACC) $*.mly

.mly.mli:
	$(OCAMLYACC) $*.mly

.mll.ml:
	$(OCAMLLEX) $*.mll

.mli.cmi:
	$(OCAMLC) $(OCAMLFLAGS) -c $*.mli

.ml.cmo:
	$(OCAMLC) $(OCAMLFLAGS) -c $*.ml

.ml.cmx:
	$(OCAMLOPT) $(OCAMLFLAGS) -c $*.ml
#
# The version.txt file
#
version.txt:
	@echo 0.0.boot > $@

# Entry point
omake: omake.exe
	@echo
