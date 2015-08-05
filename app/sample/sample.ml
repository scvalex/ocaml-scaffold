open Core.Std
open Async.Std
open Sample_lib.Std

let main () =
  do_something_awesome ();
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
