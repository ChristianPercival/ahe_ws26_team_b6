# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\git\\ele_embedded_b_group_project\\lab\\lab_02\\vtis\\micro_blaze\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\sleep.h"
  "C:\\git\\ele_embedded_b_group_project\\lab\\lab_02\\vtis\\micro_blaze\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xiltimer.h"
  "C:\\git\\ele_embedded_b_group_project\\lab\\lab_02\\vtis\\micro_blaze\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xtimer_config.h"
  "C:\\git\\ele_embedded_b_group_project\\lab\\lab_02\\vtis\\micro_blaze\\microblaze_0\\standalone_microblaze_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
