test_that("Workspace'teki bütün değişkenleri silen kod", {
  rm(list = ls())
  expect_equal(length(ls()), 0)
})
test_that("Eğer mevcut ise MapsThatChangedOurWorld_StoryMap_Data.csv adlı dosyayı silen kod", {
  if (file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv")) {
    file.remove("MapsThatChangedOurWorld_StoryMap_Data.csv")
    expect_false(file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv"))
  }
})
source(Labex1_Q1_studentnumber_surname_familyname.R)
test_that("MapsThatChangedOurWorld_StoryMap_Data.csv adlı dosya aktif dizinde mevcuttur", {
  expect_true(file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv"))
})
test_that("maps adlı değişken Global Workspace’de mevcuttur", {
  expect_true(exists("maps"))
})
test_that("maps nesnesi bir data.frame’dir", {
  expect_is(maps, "data.frame")
})
test_that("maps adlı data.frame’in ilk sütunun adı 'City' olmalıdır", {
  expect_equal(colnames(maps)[1], "City")
})
test_that("maps adlı data.frame’in 5. sütunun adında 'Title' kelimesi geçmelidir", {
  expect_true("Title" %in% colnames(maps)[5])
})
test_that("Latitude adlı sütun numeric değerlerden oluşmalıdır", {
  expect_is(maps$Latitude, "numeric")
})
test_that("Longitude adlı sütun numeric değerlerden oluşmalıdır", {
  expect_is(maps$Longitude, "numeric")
})
test_that("Year adlı sütun numeric değerlerden oluşmalıdır", {
  expect_is(maps$Year, "numeric")
})
test_that("Longitude adlı sütunun 3., 9. ve 10. elemanları negatif numeric değerler içermelidir", {
  expect_true(maps$Longitude[3] < 0)
  expect_true(maps$Longitude[9] < 0)
  expect_true(maps$Longitude[10] < 0)
})
test_that("finalResult adlı değişkenin özellikleri", {
  expect_true(exists("finalResult"))
  expect_is(finalResult, "data.frame")
  expect_equal(ncol(finalResult), 3)
  expect_equal(colnames(finalResult), c("Longitude", "Latitude", "Year"))
})