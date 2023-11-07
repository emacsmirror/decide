;;; test-decide.el --- unit tests for rolling dice and other random things
;; Copyright 2023 Pelle Nilsson
;;
;; Author: Pelle Nilsson <perni@lysator.liu.se>
;; Version: 0.10.0
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;

(ert-deftest decide-test-table-top-table-name ()
  (should (equal (decide-table-top-table-name "foo.bar") "foo"))
  (should (equal (decide-table-top-table-name "foo") "foo"))
  )

(ert-deftest decide-test-table-normalize-name ()
  (should (equal (decide-table-normalize-name "top" "aa.bb") "aa.bb"))
  (should (equal (decide-table-normalize-name "top" "aa") "top.aa"))
  )

(ert-deftest decide-test-string-to-number ()
  (should (equal (decide-string-to-number "" 1) 1))
  (should (equal (decide-string-to-number "" 2) 2))
  (should (equal (decide-string-to-number "0" 1) 0))
  (should (equal (decide-string-to-number "+" 1) 0))
  (should (equal (decide-string-to-number "-" 1) 0))
  (should (equal (decide-string-to-number "x" 1) "x"))
  (should (equal (decide-string-to-number "3" 1) 3))
  (should (equal (decide-string-to-number "-1" 1) -1))
  (should (equal (decide-string-to-number "A" 1) "A"))
  (should (equal (decide-string-to-number nil 1) 1))
  )

(ert-deftest decide-test-make-dice-spec ()
  (should (equal (decide-make-dice-spec "1d6") '(1 6 0)))
  (should (equal (decide-make-dice-spec "1d") '(1 6 0)))
  (should (equal (decide-make-dice-spec "d6") '(1 6 0)))
  (should (equal (decide-make-dice-spec "d") '(1 6 0)))
  (should (equal (decide-make-dice-spec "1d66") '(1 66 0)))
  (should (equal (decide-make-dice-spec "1d") '(1 6 0)))
  (should (equal (decide-make-dice-spec "1d8") '(1 8 0)))
  (should (equal (decide-make-dice-spec "2d6") '(2 6 0)))
  (should (equal (decide-make-dice-spec "dA") '(1 "A" 0)))
  (should (equal (decide-make-dice-spec "4dF") '(4 "F" 0)))
  (should (equal (decide-make-dice-spec "2d6+4") '(2 6 4)))
  (should (equal (decide-make-dice-spec "2d8+0") '(2 8 0)))
  (should (equal (decide-make-dice-spec "2d10+3") '(2 10 3)))
  (should (equal (decide-make-dice-spec "2d10-3") '(2 10 -3)))
  )

(ert-deftest decide-test-describe-dice-spec ()
;  (should (equal))
  )

(ert-deftest decide-test-sum-dice-rolled ()
;  (should (equal))
  )

(ert-deftest decide-test-describe-roll ()
;  (should (equal))
  )
