# Look for csparse; note the difference in the directory specifications!
find_path(CSPARSE_INCLUDE_DIR NAMES cs.h
  PATHS
  /usr/local/include  # The directory where cs.h was installed
  /usr/include
  /opt/local/include
  /sw/include
  /usr/include/ufsparse
  /opt/local/include/ufsparse
  /usr/local/include/ufsparse
  /sw/include/ufsparse
  PATH_SUFFIXES
  suitesparse
)

find_library(CSPARSE_LIBRARY NAMES csparse cxsparse libcxsparse
  PATHS
  /usr/local/lib  # The directory where libcsparse.a was installed
  /usr/lib
  /opt/local/lib
  /sw/lib
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CSparse DEFAULT_MSG
  CSPARSE_INCLUDE_DIR CSPARSE_LIBRARY)
