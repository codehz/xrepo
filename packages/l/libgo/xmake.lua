package "libgo"
  set_description "Go-style concurrency in C++11"
  set_homepage "https://github.com/codehz/libgo"
  set_urls "https://github.com/codehz/libgo.git"

  add_linkdirs "lib"
  
  add_links "libgo"
  add_syslinks "ws2_32"
  add_syslinks "wsock32"

  on_install (function (package)
    import("package.tools.cmake").install(package, {"-DBUILD_DYNAMIC=ON"})

    for _, fp in ipairs(os.files("libgo/**.h")) do
      os.cp (fp, path.join(package:installdir("include"), fp))
    end
  end)