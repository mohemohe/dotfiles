if [ (uname -s) = "Darwin" ]
  eval (/usr/libexec/path_helper -c)
  Z_VERBOSE_LOG DONE 'initialize path_helper'
end
