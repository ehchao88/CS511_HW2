(declare-const p1 Bool)
(declare-const p2 Bool)
(declare-const p3 Bool)
(declare-const p4 Bool)

(declare-fun phi (Bool Bool Bool Bool) Bool)
(assert (= (phi p1 p2 p3 p4)
        (and (or (or p1 (not p2)) (or (not p3) (not p4)))
        (and (or (or (not p1) p2) (or (not p3) (not p4)))
        (and (or (or (not p1) (not p2)) (or p3 (not p4)))
        (and (or (or (not p1) (not p2)) (or (not p3) p4))
        (and (or (or (not p1) p2) (or p3 p4))
        (and (or (or p1 (not p2)) (or p3 p4))
        (and (or (or p1 p2) (or (not p3) p4))
        (and (or (or p1 p2) (or p3 (not p4)))))))))))))

(declare-fun psi (Bool Bool Bool Bool) Bool)
(assert (= (psi p1 p2 p3 p4)
        (or (and (and (not p1) (not p2)) (and (not p3) (not p4)))
        (or (and (and p1 p2) (and (not p3) (not p4)))
        (or (and (and p1 p3) (and (not p2) (not p4)))
        (or (and (and p1 p4) (and (not p2) (not p3)))
        (or (and (and p2 p3) (and (not p1) (not p4)))
        (or (and (and p2 p4) (and (not p1) (not p3)))
        (or (and (and p3 p4) (and (not p1) (not p2)))
        (or (and (and p1 p2) (and p3 p4))))))))))))

(declare-fun theta (Bool Bool Bool Bool) Bool)
(assert (= (theta p1 p2 p3 p4)
        (not(not(=(= p1 p2) (= p3 p4))))))

(assert (not (= (phi p1 p2 p3 p4) (psi p1 p2 p3 p4))))
(assert (not (= (phi p1 p2 p3 p4) (theta p1 p2 p3 p4))))
(assert (not (= (psi p1 p2 p3 p4) (theta p1 p2 p3 p4))))
(check-sat)