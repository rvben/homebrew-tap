class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.28/husker-v0.4.28-aarch64-apple-darwin.tar.gz"
      sha256 "84a9546f5a50319962d5b58bcb8de3a23e2c742f740a2ab2e19846cacf279d4a"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.28/husker-v0.4.28-x86_64-apple-darwin.tar.gz"
      sha256 "e07da50d73a1de7d7783ae37dac25672c4fe1336c9e8d9a8e8b6c8d31d76eb1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.28/husker-v0.4.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "337c3ad3a6293758b42b6db11e62014c5cb67d5e54824fe496f933490f455276"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.28/husker-v0.4.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5f7377d1c737c772a9668b12066ce9724c2dc1a407898319a7c26fa5dfc567d"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
