(module
  ;;
  ;; Calculate the square of the sum of the first N natural numbers
  ;;
  ;; @param {i32} max - The upper bound (inclusive) of natural numbers to consider
  ;;
  ;; @returns {i32} The square of the sum of the first N natural numbers
  ;;
  (func $squareOfSum (export "squareOfSum") (param $n i32) (result i32)
    (local $sum i32)
    (local.set $sum
      (i32.div_s
        (i32.mul (local.get $n) (i32.add (local.get $n) (i32.const 1)))
        (i32.const 2)
      )
    )
    (i32.mul (local.get $sum) (local.get $sum))
  )

  ;;
  ;; Calculate the sum of the squares of the first N natural numbers
  ;;
  ;; @param {i32} max - The upper bound (inclusive) of natural numbers to consider
  ;;
  ;; @returns {i32} The sum of the squares of the first N natural numbers
  ;;
  (func $sumOfSquares (export "sumOfSquares") (param $n i32) (result i32)
    (i32.div_s
      (i32.mul
        (i32.mul (local.get $n) (i32.add (local.get $n) (i32.const 1)))
        (i32.add (i32.mul (local.get $n) (i32.const 2)) (i32.const 1))
      )
      (i32.const 6)
    )
  )

  ;;
  ;; Calculate the difference between the square of the sum and the sum of the 
  ;; squares of the first N natural numbers.
  ;;
  ;; @param {i32} max - The upper bound (inclusive) of natural numbers to consider
  ;;
  ;; @returns {i32} Difference between the square of the sum and the sum of the
  ;;                squares of the first N natural numbers.
  ;;
  (func (export "difference") (param $n i32) (result i32)
    (i32.sub
      (call $squareOfSum (local.get $n))
      (call $sumOfSquares (local.get $n))
    )
  )
)
