;
; substution.lsp
;
; Copyright(C)2024 - MT
;
; Implements a simple substitution cipher.
;
; https://en.wikipedia.org/wiki/substitution_cipher
; https://rosettacode.org/wiki/substitution_cipher
; https://rosettacode.org/wiki/Caesar_cipher
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
; 03 Nov 24 0.1   001 - Initial version - MT
; 04 Nov 24       002 - Updated  to  use a lambda function to  encode  each
;                       character - MT
;
(defvar _original   "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
(defvar _substitute "dthnxkmqrwzseglyoaubjpcfivTKXMGVUPOIRFDEJZNYWCAQSLBH")
(defvar _text       "The quick brown fox jumps over the lazy dog")

(defun encode (_plaintext _original _substitute)
  (map 'string
    #'(lambda (_char)
        (let*
          ((_offset (position _char _original)))
          (if _offset
            (aref _substitute _offset)
            _char)))
    _plaintext))

(print _text)
(setq _text (encode _text _original _substitute))
(print _text)
(setq _text (encode _text _substitute _original))
(print _text)

(exit)
