class Arping < Formula
  desc "Utility to check whether MAC addresses are already taken on a LAN"
  homepage "https://github.com/ThomasHabets/arping"
  url "https://github.com/ThomasHabets/arping/archive/arping-2.17.tar.gz"
  sha256 "ecb509561b33af07d9fae5401b5eef9a4ef4d3ffc9c906c1274aad172668907d"

  bottle do
    cellar :any
    sha256 "cfa1992d42e786f9677c5009270ce42dbce4c52e3d63563481ea6b1298d12e72" => :el_capitan
    sha256 "4302dd151fe2fb5bb0f92f970f1f05f1f2a105267fdb1d94aa3d393601f9fa0f" => :yosemite
    sha256 "7253bcac9acd7c7f09d5904a6e525c7adc16c63972a6e3019ae33679d1ad1d45" => :mavericks
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libnet"

  def install
    system "./bootstrap.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{sbin}/arping", "--help"
  end
end
