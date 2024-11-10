;
; substution.lsp
;
; Copyright (C) 2024 - MT
;
; Implements a simple substitution cipher with a shifted key.  
;
; "The quick brown fox jumps over the lazy dog" 
; "Clu WnBHl bNAwq gMC CszjG JhWe XfK SWiG fZJ" 
; "The quick brown fox jumps over the lazy dog"
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
; 08 Nov 24       003 - Updates the encryption key each time by rotating it 
;                       through fixed number of positions, making it behave
;                       like a single rotor - MT
;                     - Can  rotate the encryption key either left or right 
;                       by using a positive or negative shift - MT
;

(defvar _original   "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
(defvar _key        "dthnxkmqrwzseglyoaubjpcfivTKXMGVUPOIRFDEJZNYWCAQSLBH")

(defvar _text       "The quick brown fox jumps over the lazy dog")

(defvar _shift 7)

(defun rotate (_string _count)
  (if (< _count 0)
    (reverse (rotate (reverse _key) (* _count -1)))
    (concatenate 'string (subseq _string _count (length _string)) (subseq _string 0 _count))))

(defun encode (_text _original _key)
  (map 'string
    #'(lambda (_char)
        (let*
          ((_offset (position _char _original))
            (_next (if _offset 
              (aref _key _offset) 
              _char)))
          (setq _key (rotate _key _shift)) ; Rotate key each iteration.
          _next)) 
    _text))

(defun decode (_text _original _key)
  (map 'string
    #'(lambda (_char)
        (let*
          ((_offset (position _char _key)))
          (setq _key (rotate _key _shift))
          (if _offset
            (aref _original _offset)
            _char)))
    _text))
    
(print _text)
(setq _text (encode _text _original _key))
(print _text)
(setq _text (decode _text _original _key))
(print _text)

(exit)
