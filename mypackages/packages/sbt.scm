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

(define-module (mypackages packages sbt)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages))

;; to invoke sbt coreutils sed grep and openjdk@16 needed

(define-public sbt
  (let ((baseurl "https://github.com/sbt/sbt")
        (v "1.7.2"))
    (package
     (name "sbt")
     (version v)
     (source
      (origin
       (method url-fetch)
       (uri (string-append baseurl "/releases/download/v" v "/sbt-" v ".tgz" ))
       (sha256
        (base32 "1mqhlcmrn0g4i92iyylj9b417ihnvvh29snn67n2sgynijf86r5x"))))
     (build-system copy-build-system)
     (arguments
      (list #:validate-runpath? #f))
     (home-page baseurl)
     (synopsis "sbt is a build tool")
     (description "sbt is a build tool for Scala, Java, and more.
For general documentation, see https://www.scala-sbt.org/.")
     (license license:asl2.0))))
