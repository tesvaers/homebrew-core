class Icu4c < Formula
  desc "C/C++ and Java libraries for Unicode and globalization"
  homepage "https://ssl.icu-project.org/"
  url "https://ssl.icu-project.org/files/icu4c/63.1/icu4c-63_1-src.tgz"
  mirror "https://github.com/unicode-org/icu/releases/download/release-63-1/icu4c-63_1-src.tgz"
  version "63.1"
  sha256 ""

  bottle do
    cellar :any
    sha256 "e858556120acc0c2d52b8fb572b677856724cc28d24a7e1b2762d458a2977c8e" => :mojave
    sha256 "02afdd6a472c31351e46a3b2a38c1c77354f0cc9199c3dbd7e06bc171b3638a2" => :high_sierra
    sha256 "4270a558e2709b7cee1be047a8e890ee15bdb379825fd6dc81fdba74cd438c01" => :sierra
  end

  keg_only :provided_by_macos, "macOS provides libicucore.dylib (but nothing else)"

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-samples
      --disable-tests
      --enable-static
      --with-library-bits=64
    ]

    cd "source" do
      system "./configure", *args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/gendict", "--uchars", "/usr/share/dict/words", "dict"
  end
end
