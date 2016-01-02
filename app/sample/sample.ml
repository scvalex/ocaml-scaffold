open Core.Std
open Async.Std
open Sample_lib.Std

type t = {
  foo : int;
  bar : string;
} with sexp

let main () =
  do_something_awesome ();
  Print.printf "%s\n"
    (Sexp.to_string_mach (sexp_of_t { foo = 23; bar = "alex"; }));
  Deferred.unit
;;

let run () =
  Shutdown.shutdown_on_unhandled_exn ();
  Command.run
    (Command.async
       ~summary:"Sample app"
       Command.Spec.empty
       main)
;;

let () =
  Exn.handle_uncaught ~exit:true run
;;
