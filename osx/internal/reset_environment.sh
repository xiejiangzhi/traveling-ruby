export MACOSX_DEPLOYMENT_TARGET=10.14
export MACOSX_COMPATIBLE_DEPLOYMENT_TARGETS="10.12 10.13 10.14"
export CFLAGS=" -O3 -Wno-error=shorten-64-to-32 "
export CPPFLAGS="-I$SELFDIR/runtime/include "
export LDFLAGS="-L$SELFDIR/runtime/lib -Wl,-headerpad_max_install_names "

unset DYLD_LIBRARY_PATH
unset DYLD_INSERT_LIBRARIES
unset CFLAGS
unset CXXFLAGS
unset LDFLAGS
unset RUBYOPT
unset RUBYLIB
unset GEM_HOME
unset GEM_PATH
unset SSL_CERT_DIR
unset SSL_CERT_FILE
