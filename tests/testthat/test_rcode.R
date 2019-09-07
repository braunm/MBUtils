library(stringr)


context("Chunk matching")

test_that("regex matches chunk head patterns", {

  cb <- Rcode_pattern$chunk.begin

  s1 <- "\\begin{Rcode}"
  s2 <- "\\begin{Rcode}[options]"
  s3 <- "\\begin{Rcode}[]"
  s4 <- "  \\begin{rcode}[]   "
  s5 <- "\\begin{Rcode}[] %% comment"

  expect_match(s1, cb)
  expect_match(s2, cb)
  expect_match(s3, cb)
  expect_match(s4, cb)
  expect_match(s5, cb)

  expect_true(str_match(s1, cb)[2] %in% c(NA,""))
  expect_equivalent(str_match(s2, cb)[2], "options")
  expect_equivalent(str_match(s3, cb)[2], "")
  expect_equivalent(str_match(s4, cb)[2], "")
  expect_equivalent(str_match(s5, cb)[2], "")
})


test_that("regex matches chunk tail patterns", {

  ce <- Rcode_pattern$chunk.end

  s1 <- "\\end{Rcode}"
  s2 <- "\\end{rcode}"
  s3 <- "\\end{Rcode}  %%%%% comment"
  s4 <- "  \\end{rcode}%comment  "
  s5 <- "\t\\end{Rcode} %xxx"

  expect_match(s1, ce)
  expect_match(s2, ce)
  expect_match(s3, ce)
  expect_match(s4, ce)
  expect_match(s5, ce)

  })
