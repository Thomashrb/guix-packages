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

(define-module (mypackages packages ffmpegfdk)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages video)
  #:use-module (gnu packages audio))

(define-public ffmpegfdk
  (package
   (inherit ffmpeg)
   (name "ffmpegfdk")
   (inputs
    `(("libfdk" ,libfdk)
      ,@(package-inputs ffmpeg)))
   (arguments
    (substitute-keyword-arguments
     (package-arguments ffmpeg)
     ((#:configure-flags flags)
      '(list "--enable-libfdk-aac"))))))
