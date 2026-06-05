class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.2.0/husker-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "07ce06370dbc388905a37fef78a9219ba84c73d0980b4dce8a1db6a1023b8be0"
    else
      url "https://github.com/rvben/husker/releases/download/v0.2.0/husker-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "26a3270afd50509999039da83e42bdc768265c7f58fe30469799e13d6107d8cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.2.0/husker-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eee18d4cf8c0ef1da87d20fc8434fb9442c5b01fb2fdc93cc4821f000093812e"
    else
      url "https://github.com/rvben/husker/releases/download/v0.2.0/husker-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e018bc2bdaa4c79c29a60fa15f53d5de566d1fe55ab8e5b8c1609bf123ec0cfb"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
