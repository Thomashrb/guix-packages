;;; GNU Guix --- Functional package management for GNU
;;;
;;; This file is not part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

;;; NOTE: this package already exists in guix as orca-music
;;; I implemented this not knowing the above

(define-module (mypackages test myorca)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix packages)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages music))

(define-public myorca
  (let ((commit "cd83bcca3b1c0819f623c13949fb09beb9340664")
        (revision "0"))
    (package
     (name "myorca")
     (version (git-version "0.0.0" revision commit))
     (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hundredrabbits/Orca-c.git")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0gr9xfiw7lqnxv6cb5pssvnyjb9n3xmbpryxdd5wjzj3aj3njb5x"))))
     (build-system gnu-build-system)
     (arguments
      (list  #:make-flags
             #~(list (string-append "CC=" #$(cc-for-target)))
             #:phases
             #~(modify-phases %standard-phases
                                       (delete 'configure)
                                       (delete 'check)
                                       (replace 'install
                                                (lambda* (#:key outputs #:allow-other-keys)
                                                         (let* ((out (assoc-ref outputs "out"))
                                                                (bin (string-append out "/bin")))
                                                           (install-file "build/orca" bin)))))))
     (inputs
      `(("ncurses", ncurses)
        ("portmidi", portmidi)
        ))
     (native-inputs
      `(
        ))
     (propagated-inputs
      `(
        ))
     (home-page "https://github.com/hundredrabbits/Orca-c")
     (synopsis "The C implementation of the ORCΛ language and terminal livecoding environment")
     (description
      "Orca is an esoteric programming language and live editor designed to quickly
create procedural sequencers. Every letter of the alphabet is an operation,
lowercase letters execute on *bang*, and uppercase letters execute each frame.")
     (license license:expat))))
