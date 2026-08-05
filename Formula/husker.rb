class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.42/husker-v0.4.42-aarch64-apple-darwin.tar.gz"
      sha256 "1abd269dab840eb02f301cac775c5bdb7aafaa520ac4998290dbfeacc5a9af57"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.42/husker-v0.4.42-x86_64-apple-darwin.tar.gz"
      sha256 "384dabb0e495e1efb01da3cf313c76ced3ae2c75f1a56f83ac7cfb92ea9a545e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.42/husker-v0.4.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13791519557bcf241714cb6591c22348f98a44470f3b2f3637f8e9afd8a7f9d3"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.42/husker-v0.4.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c37ca143415749cbfd7dd8ad8b1868c0a41b1529aa06ccdff2dd019c7bfb27ce"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
