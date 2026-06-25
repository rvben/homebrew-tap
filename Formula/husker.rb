class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.20/husker-v0.4.20-aarch64-apple-darwin.tar.gz"
      sha256 "a931d92388403a7696e26f2afd291401e4b02814e75e94780bfe11ae8e1ea21d"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.20/husker-v0.4.20-x86_64-apple-darwin.tar.gz"
      sha256 "eed80307c53f2535059f3d2f8a7267e7ac0bc3191d4a5fd98810354186186d80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.20/husker-v0.4.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5e45e2d18b3e30ef7cc6d8d1a1d19f59eb9abc644fea52a81c27e0205ba3c72"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.20/husker-v0.4.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a87839f4c9599e38a85feded64b456829aa1a544d1804662d2db9b3b28e4afb3"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
