class XcbUtil < Formula
  desc "Additional extensions to the XCB library."
  homepage "http://xcb.freedesktop.org"
  url "http://xcb.freedesktop.org/dist/xcb-util-0.4.0.tar.bz2"
  sha256 "46e49469cb3b594af1d33176cd7565def2be3fa8be4371d62271fabb5eae50e9"

  option "with-static", "Build static libraries"

  depends_on "pkg-config" => :build
  depends_on "libxcb"
  depends_on "libxdmcp"   => :run
  depends_on "libxau"     => :run


  def install
        args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]
	  args << "--disable-static" if !build.with?("static")

    system "./configure", *args
    system "make"
    system "make", "install"
  end

end
