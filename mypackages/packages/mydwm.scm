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

(define-module (mypackages packages mydwm)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages suckless))

(define-public mydwm
  (package
    (inherit dwm)
    (name "mydwm")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/Thomashrb/dwm")
          (commit "fbbc9b6ebec317da20a370c181ea1852e53dbe85")))
        (sha256
          (base32 "0gq2xj4zcq82kla1frx95b1dcilkv7v59siwgxc7x5qingkjql46"))))
    (home-page "https://github.com/Thomashrb/dwm")
    (synopsis "my version of dwm")))
