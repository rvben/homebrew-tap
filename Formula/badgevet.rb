class Badgevet < Formula
  desc "Find retired and broken status badges in Markdown that link checkers miss"
  homepage "https://github.com/rvben/badgevet"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/badgevet/releases/download/v0.1.1/badgevet-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "b0434c5c87ba89038c2f90aec3b5c3e67f1f3e85fb102826d135f1383eb4a478"
    else
      url "https://github.com/rvben/badgevet/releases/download/v0.1.1/badgevet-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "b191fbb2a296e1ffe5bda905edbdbad0aaf86d44affc887a00af08398eeda369"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/badgevet/releases/download/v0.1.1/badgevet-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4c4f482dbef1eaa3af331871a6e25afa7cf95191c1fd4109ec9b9abfef90736f"
    else
      url "https://github.com/rvben/badgevet/releases/download/v0.1.1/badgevet-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65523f8d8f1c94599097f1e438778dc8a96c58fcf7e6fcad6bb74fb1f5c05280"
    end
  end

  def install
    bin.install "badgevet"
  end

  test do
    system "#{bin}/badgevet", "--version"
  end
end
