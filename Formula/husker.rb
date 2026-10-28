class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.55/husker-v0.4.55-aarch64-apple-darwin.tar.gz"
      sha256 "c91dd1086f1f6d7bed5b4d39953153cf7d34d5e0b090ea64b46e5e50175e83fa"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.55/husker-v0.4.55-x86_64-apple-darwin.tar.gz"
      sha256 "e7a04765601840d0716e310980d75ada2ce50fcadd94a9a575ccaa555c5c1d1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.55/husker-v0.4.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1116e268acea0355fcb883ce8b8fb1cd8a919648318f70e585fa9f024aa4ae28"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.55/husker-v0.4.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e253960d2713764237d6fad323856c769ca87932b67a19bfef31109f31b4fae"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
