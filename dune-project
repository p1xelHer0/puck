(lang dune 2.5)

(name puck)

(documentation "https://github.com/p1xelHer0/puck/README.md")

(source
 (github p1xelHer0/puck))

(authors "Pontus Nagy")

(maintainers "Pontus Nagy")

(license "MIT")

(generate_opam_files true)

(package
 (name puck)
 (synopsis "puck is a zsh prompt")
 (description "puck is a zsh prompt")
 (depends
  (ocaml
   (>= 4.10.0))
  (dune
   (>= 2.5.1))
  (bos
   (>= 0.2.0))
  (alcotest :with-test)
  (odoc :with-doc)))
