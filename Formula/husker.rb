class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.18/husker-v0.4.18-aarch64-apple-darwin.tar.gz"
      sha256 "cafe1ff99d3706da33fb06df04ac3875ff2ce495e6922058b0bc06c4c8b6c368"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.18/husker-v0.4.18-x86_64-apple-darwin.tar.gz"
      sha256 "ccd7dacc71fd3cf1b715c0d696b429dcbad2970dacb812b7f768f192b6b7743b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.18/husker-v0.4.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd50e7daf66b0ec5214611078072cbffa7d2f753db28145ed6628fab3b2aadf6"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.18/husker-v0.4.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42ac85d7e3c77c67bc6a8ec2ed81ef2690f1302c2c3cefca731f133dc3c2a9cf"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
