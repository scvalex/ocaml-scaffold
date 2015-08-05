Sample OCaml Project
====================

Build tools
-----------

    # install opam
    $ opam switch 4.02.3
    $ eval $(opam config env)
    $ opam install jenga

Build
-----

    make    # build once
    make p  # build and poll for changes

Structure
---------

    project-root/
      app/
        my_awesome_app/
          mlbuild
          *.ml
          *.mli
        ...
      lib/
        the_last_library_you_will_ever_need/
          mlbuild
          *.ml
          *.mli
          ...

Binaries must be placed under named directories under `app/`.
Libraries must be placed under named directories under `lib/`.  The
executable and library names are inferred from the directory that
contains them.  Both apps and libraries must have an `mlbuild` file.

mlbuild
-------

    type t = {
      (* in-project libraries *)
      libraries          : string list sexp_option;
      (* ocamlfind libraries *)
      external_libraries : string list sexp_option;
      (* other libraries to specify to the linker *)
      foreign_libraries  : string list sexp_option;
    } with sexp
