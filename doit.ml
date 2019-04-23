#! /usr/bin/env ocaml

#use "topfind"
#require "unix"

type color =
  | Red
  | Green
  | Yellow
  | Blue
  | Magenta
  | Cyan

let colors = [
  Red;
  Green;
  Yellow;
  Blue;
  Magenta;
  Cyan;
]

let encode_color = function
  | Red     -> "\027[31m"
  | Green   -> "\027[32m"
  | Yellow  -> "\027[33m"
  | Blue    -> "\027[34m"
  | Magenta -> "\027[35m"
  | Cyan    -> "\027[36m"

let colorful = ref true

let paint c s =
  match !colorful with
  | true  -> (encode_color c) ^ s ^ "\027[0m"
  | false -> s

let pr c s =
  Printf.printf "%s\n" (paint Red s);
  flush stdout

let _ =
  let ic = Unix.open_process_in "./tic" in
  try
    while true do
      pr Red (input_line ic)
    done
  with
    End_of_file -> close_in ic;
