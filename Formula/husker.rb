class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.2/husker-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "1e38dff2e36124373e747de86a6d220fc51bf7fb6c43cc0d97f97404b13d1d16"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.2/husker-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "ec973c2ad64d1393a7153458e1529e9c4596e23d400389de4c4ba6dcd40070b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.2/husker-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ee9e7ee935179ad6905e22e5ec02a327f6ec250513f4e07fbe2ecd461dd09fd"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.2/husker-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aae7ba4e5ff22888c153d187db7bb055d9ba5c06f0d6bcdfe97d82245a69476b"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
