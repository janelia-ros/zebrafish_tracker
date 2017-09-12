SET(FLYCAPTURE_ROOT "/usr")
SET(FLYCAPTURE_LAYOUT "FHS")

SET(FLYCAPTURE_TEST_INCLUDE_PATHS ${FLYCAPTURE_ROOT}/include/flycapture)
SET(FLYCAPTURE_TEST_LIB_PATHS ${FLYCAPTURE_ROOT}/lib)
FIND_PATH(FLYCAPTURE_INCLUDE_PATH FlyCapture2.h
  ${FLYCAPTURE_TEST_INCLUDE_PATHS}
  )
FIND_LIBRARY(FLYCAPTURE_LIBRARY flycapture ${FLYCAPTURE_TEST_LIB_PATHS})
SET(FLYCAPTURE_LIBRARIES ${FLYCAPTURE_LIBRARY})
SET(FLYCAPTURE_INCLUDE_DIRS ${FLYCAPTURE_INCLUDE_PATH})