(module
  (func (export "as-if-else") (param i32 i32) (result i32)
    (block (result i32)
      (if (result i32)
        (get_local 0)
        (then (get_local 1))
        (else (br_table 1 0 (i32.const 4) (i32.const 0)))
      )
    )
  )

  (func (export "multiple-value") (param i32) (result i32)
    (local i32)
    (set_local 1 (block (result i32)
      (set_local 1 (block (result i32)
        (set_local 1 (block (result i32)
          (set_local 1 (block (result i32)
            (set_local 1 (block (result i32)
              (br_table 3 2 1 0 4 (i32.const 200) (get_local 0))
              (return (i32.add (get_local 1) (i32.const 99)))
            ))
            (return (i32.add (get_local 1) (i32.const 10)))
          ))
          (return (i32.add (get_local 1) (i32.const 11)))
        ))
        (return (i32.add (get_local 1) (i32.const 12)))
      ))
      (return (i32.add (get_local 1) (i32.const 13)))
    ))
    (i32.add (get_local 1) (i32.const 14))
  )

  (func (export "as-if-else2") (param i32 i32) (result i32)
    (block (result i32)
      (if (result i32)
        (get_local 0)
        (then (get_local 1))
        (else (br_table 1 0 (i32.const 4) (i32.const 0)))
      )
    )
  )

  (func (export "as-if-then") (param i32 i32) (result i32)
    (block (result i32)
      (if (result i32)
        (get_local 0)
        (then (br_table 1 (i32.const 3) (i32.const 0)))
        (else (get_local 1))
      )
    )
  )

  (func (export "nested-block-value") (param i32) (result i32)
    (block (result i32)
      (drop (i32.const -1))
      (i32.add
        (i32.const 1)
        (block (result i32)
          (i32.add
            (i32.const 2)
            (block (result i32)
              (drop (i32.const 4))
              (i32.add
                (i32.const 8)
                (br_table 0 1 2 (i32.const 16) (get_local 0))
              )
            )
          )
        )
      )
    )
  )
)
