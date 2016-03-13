class Libxrender < Formula
  desc "Xorg Libraries: libXrender"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXrender-0.9.9.tar.bz2"
  sha256 "fc2fe57980a14092426dffcd1f2d9de0987b9d40adea663bd70d6342c0e9be1a"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build

  depends_on "libx11"
  depends_on "libxau"      =>  :run
  depends_on "libxcb"      =>  :run
  depends_on "libxdmcp"    =>  :run
  depends_on "renderproto" =>  :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]
	  args << "--disable-static" if !build.with?("static")

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"

  end
end
