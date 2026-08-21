class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.46/husker-v0.4.46-aarch64-apple-darwin.tar.gz"
      sha256 "9ea9a0f83aed62aefcf580f12087997a164fa08ce56890763dcbb169c0191984"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.46/husker-v0.4.46-x86_64-apple-darwin.tar.gz"
      sha256 "5cfd91315367ceb3fbbce7fbeebdf7b9c97cf322e373503d84f1729c5efb249c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.46/husker-v0.4.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "313209a97f9b74e8b9c89342bebf54b4e14aa151929de6f115e2964bfbab497a"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.46/husker-v0.4.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b767f85e664a7b758385e7de2c99f9d8f470005d150df8c22c855a44fbe37f4"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
