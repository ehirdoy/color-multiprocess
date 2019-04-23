open Lwt.Infix

let proc rep tic =
  let cmdstr = " ./tic" in
  let cmdstr = " REP=" ^ (string_of_int rep) ^ cmdstr in
  let cmdstr = " TIC=" ^ (string_of_int tic) ^ cmdstr in
  let cmdarr = Lwt_process.shell cmdstr in
  let pr = Lwt_process.open_process_in cmdarr in
  let rec loop () =
    if false then Lwt.return_unit else
      let ic = pr#stdout in
      Lwt_io.read_line ic >>= fun s ->
      Lwt_io.printl s >>= fun () -> loop ()
  in
  loop ()

let () =
  Lwt_main.run (Lwt.join [
      proc 5 3;
      proc 9 1;
    ])
