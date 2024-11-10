;
; substution.lsp
;
; Copyright(C)2024 - MT
;
; Implements a simple substitution cipher.
;
; https://en.wikipedia.org/wiki/substitution_cipher
; https://rosettacode.org/wiki/substitution_cipher
;
; This  program is free software: you can redistribute it and/or modify  it
; under  the  terms of the GNU General Public License as published  by  the
; Free  Software  Foundation, either version 3 of the License, or (at  your
; option) any later version.
;
; This  program  is  distributed in the hope that it will  be  useful,  but
; WITHOUT   ANY   WARRANTY;   without  even   the   implied   warranty   of
; MERCHANTABILITY  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
; Public License for more details.
;
; You  should have received a copy of the GNU General Public License  along
; with this program.  If not, see <http://www.gnu.org/licenses/>.
;
; 03 Nov 24 0.1   001 - initial version - MT
;

(defvar _original   "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
(defvar _substitute "dthnxkmqrwzseglyoaubjpcfivTKXMGVUPOIRFDEJZNYWCAQSLBH")
(defvar _text       "The quick brown fox jumps over the lazy dog")

(defun encode (_plaintext _original _substitute)
  (let*
    ((_cyphertext (make-array (length _plaintext)
        :fill-pointer (length _plaintext)
        :adjustable t
        :initial-contents ""
        :element-type (array-element-type _plaintext))))
    (dotimes (_counter (length _plaintext))
      (let*
        ((_offset (position (aref _plaintext _counter) _original))) ; Position of current character in plaintext
        (if _offset
          (vector-push-extend ( aref _substitute _offset) _cyphertext) ; Do if true
          (vector-push-extend ( aref _plaintext _counter) _cyphertext) ; Do if false
        )
      ))
    _cyphertext))

(print _text)
(setq _text (encode _text _original _substitute))
(print _text)
(setq _text (encode _text _substitute _original))
(print _text)

(exit)
